//
//  WebService.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 29/09/22.
//

import Foundation

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

class WebService{
    
    var url = "https://techhub.docsolutions.com/OBFirmaElectronicaDev/WebApi"
    var ruteservice = "/api/authentication/authentication"
    
    func login(username: String, hassPass: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void){
        guard let url = URL(string: url+ruteservice) else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
                
        let nCoordinates = Coordinates(latitude: "37.785834", longitude: "-122.406417")
        
        let nRequestDataInfo = RequestDataInfo(fileID: 0, coordinates: nCoordinates, soVersion: "16.0", phoneBrand: "Apple", phoneModel: "x86_64", ip: "169.254.8.86", macAddress: "169.254.8.86", browserRefer: "iOS")
        
        let nBody = Body(requestDataInfo: nRequestDataInfo, username: username, password: password, passwordHash: hassPass)
        
        let body = AuthenticationInput(body: nBody, encryptedBody: "", securityData: "", pKey: "")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                    
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(AuthenticationOutput.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let tokens = loginResponse.body.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(tokens))
            
        }.resume()
        
        
    }
    
}
