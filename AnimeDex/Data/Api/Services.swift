//
//  Services.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

import Alamofire
import Foundation

struct APIError: Error, Decodable {
    let code: Int
    let message: String
}

class Api {
    static let shared = Api()
    private let session: Session
    
    private init() {
        let confifuration = URLSessionConfiguration.default
        confifuration.timeoutIntervalForRequest = 30
        confifuration.timeoutIntervalForResource = 30
        
        self.session = Session(configuration: confifuration)
    }
    
    func request<T: Codable>(url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
            session.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let decodedResponse):
                        completion(.success(decodedResponse))
                    case .failure:
                        if let data = response.data, let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                            completion(.failure(apiError))
                        } else {
                            completion(.failure(APIError(code: 500, message: "Unknown error")))
                        }
                    }
                }
        }
    
}


