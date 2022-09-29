//
//  Authentication.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 29/09/22.
//

import SwiftUI

class Authentication: ObservableObject{

    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable{
        case invalidCredentials
        
        var id: String{
            self.localizedDescription
        }
        
        var errorDescription: String?{
            switch self{
            
            case .invalidCredentials:
                return NSLocalizedString("Either your email or password are incorrect. Please try again", comment: "")
            }
        }
        
    }
    
    func updateValidation(success: Bool){
        withAnimation{
            isValidated = success
        }
    }
    
}
