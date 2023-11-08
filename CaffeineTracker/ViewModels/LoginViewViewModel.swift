//
//  LoginViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/25.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = "i'm an error msg!"
    
    init() {}
    
    func login() {
        print("login() called")
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill in all fields"
            return false
        }
        print("Called")
        
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter valid email"
            return false
        }
        
        return true
    }
    
    // configure email link sign in
    
    
}
