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

    @Published var allRequest = AllRequestOutput.self
    @Published var getAllRq = [FileCustomDataResponse]()
    //@Published var error: Authentication.AuthenticationError?
    
    var username: String = ""
    var password: String = ""
    
    var loginDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    func login(){
        let defaults = UserDefaults.standard
        
        WebService().login(username: "brayan.rodriguez@docsolutions.com", hassPass: passSha256(pass: "123456789"), password: "123456789"){ result in
            switch result {
            case .success(let token):
                defaults.setValue("Bearer "+token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    
                }
     
                
                
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        
    }



    func getAllRequests(){
        WebService().getAllRequest(){ result in
            switch result{
                
            case .success(let allResquest): DispatchQueue.main.async {
                self.getAllRq = allResquest.body.fileCustomDataResponse ?? []
            }
            
            case .failure(let error): print(error.localizedDescription)
                
                
            }
            
    
            
        }
        
        
    }
    
    
    func passSha256(pass: String) -> String{
        let inputData = Data(pass.utf8)
        let hashed = SHA256.hash(data: inputData)
        let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
        
        return hashString
        
    }
    
}
