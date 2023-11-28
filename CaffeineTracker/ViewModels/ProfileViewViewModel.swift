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
    
    func saveProfilePic() {
        
    }
    
    private func persistImageToStorage(completion: @escaping (URL?) -> Void) {
        print("Image called")
        //let filename = UUID().uuidString
        guard let uid = Auth.auth().currentUser?.uid else {
            print("No uid")
            completion(nil)
            return}
        
        if let profilepic = profilepic {print("Profile pic exists")} else {
            print("Profile pic is nil")
        }
        
        guard let imageData = profilepic?.jpegData(compressionQuality: 0.5) else {
            print("Can't load profile")
            completion(nil)
            return}
        let ref = Storage.storage().reference(withPath: uid)
        ref.putData(imageData, metadata: nil) {metadata, err in
            if let err = err {
                print("Failed to push image to storage: \(err)")
                completion(nil)
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                print("Failed to retrieve image url: \(err)")
                completion(nil)
                return
                }
                
                print("Successfully stored image with url: \(url?.absoluteString ?? "")")
                completion(url)
            }
        }}
    
    
}
