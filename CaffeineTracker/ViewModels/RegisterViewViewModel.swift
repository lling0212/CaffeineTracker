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
//    @Published var registerError = ""
    @Published var userMsg = ""
    
    init() {
        userMsg = "No error"
    }
    
    // func: register
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) 
            { [weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.userMsg = "Register failed :( Please try again."
                return
            }
            self?.insertUserRecord(id: userId)
        }
        
        print("User creation succeeded")
        
        
        
        
    }
    
    // func: insert user record
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           firstName: firstName,
                           lastName: lastName,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    // func: validate
    private func validate() -> Bool {
        guard !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            userMsg = "Make sure all fields are filled"
            return false
        }
        
        
        guard password == confirmPassword
        else {
            userMsg = "Make sure your passwords match"
            return false
        }
        
        
        guard email.contains("@") && email.contains(".")
        else {
            userMsg = "Invalid email"
            return false
        }
        
        guard password.count >= 6 else {
            userMsg = "Password must be at least 6 characters long"
            return false
        }
        
        return true
    }
    
    
    
}
