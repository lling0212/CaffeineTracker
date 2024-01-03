//
//  ProfileViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SwiftUI


class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    @Published var profilepic: UIImage? = nil
    @Published var profileURL: URL?
    @Published var newProfilePic: UIImage? = nil
    var ref: StorageReference?
    
    func fetchUser() {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    firstName: data["firstName"] as? String ?? "",
                    lastName: data["lastName"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0,
                    profileURL: data["profileURL"] as? String ?? ""
                )
                
                self?.loadUserProfile { (image) in
                    if let image = image {
                        print("image exists")
                        self?.profilepic = image
                    } else {
                        print("no image")
                    }
                }
            }
            
            
        }
        
        
    }
    
    func loadUserProfile(completion: @escaping (UIImage?) -> Void) {
        print("called loadUserProfile")
        guard let user = user else {
            print("no user")
            completion(nil)
            return
        }
        
        if user.profileURL.isEmpty {
            print("No profile url")
            completion(nil)
            return
        }
        
        let profileRef = Storage.storage().reference(forURL: user.profileURL)
        
        profileRef.getData(maxSize: 3 * 1024 * 1024) {data, error in
                if let error = error {
                    print("error in loadUserProfile")
                    print(error)
                    completion(nil)
                    return
                } else {
                    print("no error in loadUserProfile")
                    completion(UIImage(data: data!))
                    return
                }
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
    
    func updateProfilePic() {
        print("uploading new profile pic")
        
        guard let user = user else {
            print("no user")
            return
        }
        
        if let profilepic = newProfilePic {print("Profile pic exists")} else {
            print("Profile pic is nil")
        }
        
        guard let imageData = newProfilePic?.jpegData(compressionQuality: 0.5) else {
            print("Can't load profile")
            return}
        print("Can load profile")
        
        if user.profileURL.isEmpty {
            ref = Storage.storage().reference(withPath: user.id)
        } else {
            ref = Storage.storage().reference(forURL: user.profileURL)
        }
        
        ref?.putData(imageData, metadata: nil) {metadata, err in
            if let err = err {
                print("Failed to push image to storage: \(err)")
                return
            }
            
            self.ref?.downloadURL { url, err in
                if let err = err {
                    print("Failed to retrieve image url: \(err)")
                    return
                }
                
                print("Successfully stored image with url: \(url?.absoluteString ?? "")")
                
                if let url = url {
                    let db = Firestore.firestore()
                    let userRecord = db.collection("users").document(user.id)
                    userRecord.setData(["profileURL": url.absoluteString], merge: true)
                }
            }
        }
        
        
    }
    
    
    
}
