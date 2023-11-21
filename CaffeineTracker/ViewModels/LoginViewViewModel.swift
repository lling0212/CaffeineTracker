//
//  LoginViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/25.
//

import FirebaseAuth
import Foundation

// fix switch cases for error codes 

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errormsg = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            
            if let error = error {
                let errCode = (error as NSError).code
                
                switch errCode {
                case AuthErrorCode.wrongPassword.rawValue:
                    strongSelf.errormsg = "Incorrect password"
                case AuthErrorCode.userNotFound.rawValue:
                    strongSelf.errormsg = "User not found"
                default:
                    strongSelf.errormsg = "An error occurred"
                }
                
            }
        }
        
    }
    
    func validate() -> Bool {
        
        errormsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            objectWillChange.send()
            errormsg = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            objectWillChange.send()
            errormsg = "Please enter valid email"
            return false
        }
        
        return true
    }
    
    // configure email link sign in
    
    
}
