//
//  AllRequestOutput.swift
//  DemoSign
//
//  Created by Brandon Alexis Martinez Cortes on 04/10/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allRequestOutput = try? newJSONDecoder().decode(AllRequestOutput.self, from: jsonData)

import Foundation

// MARK: - AllRequestOutput
struct AllRequestOutput: Codable {
    let transactionID: String
    let body: Bodyn
    let encryptedBody, securityData: JSONNulls?
    let isOK: Bool
    let messages: JSONNulls?
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
struct Bodyn: Codable {
    let fileCustomDataResponse: [FileCustomDataResponse]?
    let confPaginado: ConfPaginado
    let countItems: Int

    enum CodingKeys: String, CodingKey {
        case fileCustomDataResponse
        case confPaginado = "ConfPaginado"
        case countItems = "CountItems"
    }
}

// MARK: - ConfPaginado
struct ConfPaginado: Codable {
    let viewItems, countPage: Int

    enum CodingKeys: String, CodingKey {
        case viewItems
        case countPage = "CountPage"
    }
}

// MARK: - FileCustomDataResponse
struct FileCustomDataResponse: Codable {
    let id: Int
    let folio, reference: String
    let agentUser: String
    let fullName: String
    let creationDate: String
    let currentUser: String
    let vigencia: String?
    let status: String
    let clasificationID: Int
    let clasificacion: String
    let statusVigencia: String
    let tooltip: String
    let applicant: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case folio = "Folio"
        case reference = "Reference"
        case agentUser = "AgentUser"
        case fullName = "FullName"
        case creationDate = "CreationDate"
        case currentUser = "CurrentUser"
        case vigencia = "Vigencia"
        case status = "Status"
        case clasificationID = "Clasification_Id"
        case clasificacion = "Clasificacion"
        case statusVigencia = "StatusVigencia"
        case tooltip = "Tooltip"
        case applicant = "Applicant"
    }
}

enum EntUser: String, Codable {
    case brayanRodriguezDocsolutionsCOM = "brayan.rodriguez@docsolutions.com"
    case eduardoRomeroDocsolutionsCOM = "eduardo.romero@docsolutions.com"
    case valenyGonzalezDocsolutionsCOM = "valeny.gonzalez@docsolutions.com"
}

enum Clasificacion: String, Codable {
    case firmaElectrónicaDeExpediente = "Firma electrónica de expediente"
}

enum FullName: String, Codable {
    case brayanAntonioRodríguezFlores = "Brayan Antonio Rodríguez Flores"
}

enum StatusVigencia: String, Codable {
    case enTiempo = "EnTiempo"
    case vencido = "Vencido"
}

enum Tooltip: String, Codable {
    case enTiempo = "En tiempo"
    case vencido = "Vencido"
}

// MARK: - Encode/decode helpers

class JSONNulls: Codable, Hashable {

    public static func == (lhs: JSONNulls, rhs: JSONNulls) -> Bool {
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

#if DEBUG
// MARK: - Example Item
extension AllRequestOutput {
    
    static var example: FileCustomDataResponse {

        FileCustomDataResponse(id: 122914, folio: "0000122914", reference: "Prueba de solicitud", agentUser: "brayan.rodriguez@docsolutions.com", fullName: "Brayan Antonio Rodríguez Flores", creationDate: "2022-10-03T22:52:31.2534556", currentUser: "brayan.rodriguez@docsolutions.com", vigencia: "2022-10-30T05:00:00", status: "Nuevo expediente", clasificationID: 21, clasificacion: "Firma electrónica de expediente", statusVigencia: "Firma electrónica de expediente", tooltip: "En tiempo", applicant: "Juan Carlos")
    }
}
#endif


