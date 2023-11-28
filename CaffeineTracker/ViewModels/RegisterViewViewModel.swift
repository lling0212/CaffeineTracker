//
//  RegisterViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/23.
//

// understand guard
// need to add error message

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class RegisterViewViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    // @Published var loginStatus = ""
    @Published var userMsg = ""
    @Published var profilepic: UIImage?
    @Published var profileURL: URL?
    
    init() {
        userMsg = ""
    }
    
    // func: register
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) 
            { [weak self] result, error in
            guard let userId = result?.user.uid else {
//                self?.userMsg = "Register failed :( Please try again."
                return
            }
                
            self?.persistImageToStorage { (url) in
                if let url = url {
                    self?.insertUserRecord(id: userId, profileURL: url)
                } else {
                    self?.insertUserRecord(id: userId, profileURL: nil)
                }
                
            }
        }
        
        print("User creation succeeded")
        
        
        
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
    
    
    private func insertUserRecord(id: String, profileURL: URL?) {
        let newUser = User(id: id,
                           firstName: firstName,
                           lastName: lastName,
                           email: email,
                           joined: Date().timeIntervalSince1970,
                           profileURL: profileURL)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
//    private func storeImageURL(imageProfileURL: URL) {
//        let newUser = User(id: id,
//                           firstName: firstName,
//                           lastName: lastName,
//                           email: email,
//                           joined: Date().timeIntervalSince1970)
////                           profileURL: profilepicURL)
//        
//        let db = Firestore.firestore()
//        
//        db.collection("users")
//            .document(id)
//            .setData(newUser.asDictionary())
//    }
    
    // func: validate
    private func validate() -> Bool {
        guard !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            userMsg = "Make sure all fields are filled"
            return false
        }
        
        guard password == confirmPassword
        else {
            userMsg = "Make sure your passwords match"
            print(password)
            print(confirmPassword)
            print("Passwords don't match")
            return false
        }
        
        
        guard email.contains("@") && email.contains(".")
        else {
            userMsg = "Invalid email"
            print(userMsg)
            return false
        }
        
        guard password.count >= 6 else {
            userMsg = "Password must be at least 6 characters long"
            print(userMsg)
            return false
        }
        
        return true
    }
    
    
    
}
