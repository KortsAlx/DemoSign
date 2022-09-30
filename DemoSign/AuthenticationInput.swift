//
//  AuthenticationInput.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 29/09/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authenticationInput = try? newJSONDecoder().decode(AuthenticationInput.self, from: jsonData)

import Foundation

// MARK: - AuthenticationInput
struct AuthenticationInput: Codable {
    let body: Body
    let encryptedBody, securityData, pKey: String

    enum CodingKeys: String, CodingKey {
        case body = "Body"
        case encryptedBody = "EncryptedBody"
        case securityData = "SecurityData"
        case pKey = "PKey"
    }
}

// MARK: - Body
struct Body: Codable {
    let requestDataInfo: RequestDataInfo
    let username, password, passwordHash: String

    enum CodingKeys: String, CodingKey {
        case requestDataInfo = "RequestDataInfo"
        case username = "Username"
        case password = "Password"
        case passwordHash = "PasswordHash"
    }
}

// MARK: - RequestDataInfo
struct RequestDataInfo: Codable {
    let fileID: Int
    let coordinates: Coordinates
    let soVersion, phoneBrand, phoneModel, ip: String
    let macAddress, browserRefer: String

    enum CodingKeys: String, CodingKey {
        case fileID = "File_Id"
        case coordinates = "Coordinates"
        case soVersion = "SOVersion"
        case phoneBrand = "PhoneBrand"
        case phoneModel = "PhoneModel"
        case ip = "IP"
        case macAddress = "MacAddress"
        case browserRefer = "BrowserRefer"
    }
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String

    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
}
