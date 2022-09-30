//
//  AuthenticationOutput.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 29/09/22.
//

import Foundation

// MARK: - AuthenticationOutput
struct AuthenticationOutput: Codable {
    let transactionID: String
    let body: Bodys
    let encryptedBody, securityData: JSONNull?
    let isOK: Bool
    let messages: JSONNull?
    let responseCode: Int

    enum CodingKeys: String, CodingKey {
        case transactionID = "TransactionId"
        case body = "Body"
        case encryptedBody = "EncryptedBody"
        case securityData = "SecurityData"
        case isOK = "IsOK"
        case messages = "Messages"
        case responseCode = "ResponseCode"
    }
}

// MARK: - Body
struct Bodys: Codable {
    let userLoginData: UserLoginData
    let jwtExpireTimeOfflineMinutes: Int
    let token: String?

    enum CodingKeys: String, CodingKey {
        case userLoginData = "UserLoginData"
        case jwtExpireTimeOfflineMinutes = "JWTExpireTimeOfflineMinutes"
        case token = "Token"
    }
}

// MARK: - UserLoginData
struct UserLoginData: Codable {
    let id: Int
    let username, name, fatherLastName, motherLastName: String
    let email, phoneNumber, phoneNumberMask: String
    let userAlias: JSONNull?
    let metadata: [Metadatum]
    let securityLoginData: SecurityLoginData
    let currentFileID: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case username = "Username"
        case name = "Name"
        case fatherLastName = "FatherLastName"
        case motherLastName = "MotherLastName"
        case email = "Email"
        case phoneNumber = "PhoneNumber"
        case phoneNumberMask = "PhoneNumberMask"
        case userAlias = "UserAlias"
        case metadata = "Metadata"
        case securityLoginData = "SecurityLoginData"
        case currentFileID = "CurrentFileId"
    }
}

// MARK: - Metadatum
struct Metadatum: Codable {
    let name, groupName, value: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case groupName = "GroupName"
        case value = "Value"
    }
}

// MARK: - SecurityLoginData
struct SecurityLoginData: Codable {
    let roles: [Role]
    let applications: [Application]

    enum CodingKeys: String, CodingKey {
        case roles = "Roles"
        case applications = "Applications"
    }
}

// MARK: - Application
struct Application: Codable {
    let id: Int
    let name: String
    let modules: [Module]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case modules = "Modules"
    }
}

// MARK: - Module
struct Module: Codable {
    let id: Int
    let name: String
    let functions: [Role]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case functions = "Functions"
    }
}

// MARK: - Role
struct Role: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
