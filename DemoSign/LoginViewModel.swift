//
//  LoginViewModel.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 28/09/22.
//

import Foundation
import CryptoKit

class LoginViewModel: ObservableObject{
    //@Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    @Published var isAuthenticated: Bool = false

    
    var username: String = ""
    var password: String = ""
    
    var loginDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    func login(){
        let defaults = UserDefaults.standard
        
        WebService().login(username: username, hassPass: passSha256(pass: password), password: password){ result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        
            
            
        }
        
        //showProgressView = true
        
        //completion(true)
    }
    
    
    func passSha256(pass: String) -> String{
        var inputData = Data(pass.utf8)
        let hashed = SHA256.hash(data: inputData)
        let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
        
        return hashString
        
    }
    
}
