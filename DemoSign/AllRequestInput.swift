//
//  AllRequestInput.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 04/10/22.
//

import Foundation

// MARK: - AllRequestInput
struct AllRequestInput: Codable {
    let body: Bodyi
    let encryptedBody, securityData, pKey: String

    enum CodingKeys: String, CodingKey {
        case body = "Body"
        case encryptedBody = "EncryptedBody"
        case securityData = "SecurityData"
        case pKey = "PKey"
    }
}

// MARK: - Body
struct Bodyi: Codable {
    let fechaInicio, fechaFin: String

    enum CodingKeys: String, CodingKey {
        case fechaInicio = "FechaInicio"
        case fechaFin = "FechaFin"
    }
}
