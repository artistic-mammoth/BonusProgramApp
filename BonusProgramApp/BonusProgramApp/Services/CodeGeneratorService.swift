//
//  CodeGeneratorService.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import Foundation

final class CodeGeneratorService {
    // MARK: - Singleton
    static let shared = CodeGeneratorService()
    private init() { }

    // MARK: - Private properties
    private let GENERATOR_API_KEY: String = KeysAPIService.get().GENERATOR_API_KEY
    private let baseURL: String = "https://api.random.org/json-rpc/4/invoke"
    private let header = ["Content-Type" : "application/json"]
    private let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    private let lengthOfCode = 8

    // MARK: - Public methods
    func getCode(completion: @escaping (String) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: getJsonBody()) else { return }

        var request = URLRequest(url: url)
        request.httpBody = jsonData
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            if let dataJSON = try? JSONDecoder().decode(RandomCodeResponse.self, from: data) {
                let code = dataJSON.result?.random?.data?.first
                completion(code ?? "NO DATA")
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now()+2) {
            task.resume()
        }
    }
    
    // MARK: - Private methods
    private func getJsonBody() -> [String: Any] {
        [
            "jsonrpc": "2.0",
            "method": "generateStrings",
            "params": [
                "apiKey": GENERATOR_API_KEY,
                "n": 1,
                "length": lengthOfCode,
                "characters": characters,
                "replacement": true
            ],
            "id": 0
        ]
    }
}
