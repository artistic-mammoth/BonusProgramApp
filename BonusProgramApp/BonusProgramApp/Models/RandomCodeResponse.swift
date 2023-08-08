//
//  RandomCodeResponse.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

// MARK: - RandomCodeResponse
struct RandomCodeResponse: Codable {
    let jsonrpc: String?
    let result: Result?
    let id: Int?
}

struct Result: Codable {
    let random: Random?
    let bitsUsed, bitsLeft, requestsLeft, advisoryDelay: Int?
}

struct Random: Codable {
    let data: [String]?
    let completionTime: String?
}
