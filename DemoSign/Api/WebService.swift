//
//  WebService.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 29/09/22.
//

import Foundation

enum AError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

class WebService{
    
    var url = "https://techhub.docsolutions.com/OBFirmaElectronicaDev/WebApi"
    var auth = "/api/authentication/authentication"
    var allRequest = "/api/file/GetFilesCustom"
    var infoRequest = "/api/file/GetFileInfoCustom"
    
    func login(username: String, hassPass: String, password: String, completion: @escaping (Result<String, AError>) -> Void){
        guard let url = URL(string: url+auth) else {
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
    
    func getAllRequest(completion: @escaping (Result<AllRequestOutput, AError>) -> Void){
        var AuthTokenString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImJyYXlhbi5yb2RyaWd1ZXpAZG9jc29sdXRpb25zLmNvbSIsIm5hbWVpZCI6IjYzNCIsIm5iZiI6MTY2NDkwNDU2OSwiZXhwIjoxNjY0OTkwOTY5LCJpYXQiOjE2NjQ5MDQ1NjksImlzcyI6IkF1dGVudGljYWNpb25PbkJvYXJkaW5nU2VydmljZSIsImF1ZCI6IkRlZmF1bHRBdWRpZW5jZSJ9.e66CVpTyWnuQd7DrmeVY0BFks7PLjKNrfLeXZ6_UuiQ"
        
        guard let url = URL(string: url+allRequest) else {
            completion(.failure(.custom(errorMessage: "URL ERROR")))
            return
        }
        
        let bd = Bodyi(fechaInicio: "", fechaFin: "")
        let body = AllRequestInput(body: bd, encryptedBody: "", securityData: "", pKey: "")
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "NO DATA")))
                    
                return
            }
            
            guard let allRequestResponse = try? JSONDecoder().decode(AllRequestOutput.self, from: data) else {
                completion(.failure(.invalidCredentials))

            
                return
            }
            
            /*guard let allRequestGet = allRequestResponse.body.fileCustomDataResponse else {
                
                completion(.failure(.invalidCredentials))
                return
            }*/
            
            completion(.success(allRequestResponse))
            
        }.resume()
        
        
        
        
    }
    
}
