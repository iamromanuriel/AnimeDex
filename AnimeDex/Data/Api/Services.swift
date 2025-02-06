//
//  Services.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

import Alamofire
import Foundation
import Combine

struct APIError: Error, Decodable {
    let code: Int
    let message: String
}

class Api {
    static let shared = Api()
    private let session: Session

    enum UrlServices: String {
        case TopAnime = "top/anime"
        case TopCharacter = "top/characters"
    }

    
    private init() {
        let confifuration = URLSessionConfiguration.default
        confifuration.timeoutIntervalForRequest = 30
        confifuration.timeoutIntervalForResource = 30
        
        self.session = Session(configuration: confifuration)
    }
    
    func request<T: Decodable>(url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil) -> AnyPublisher<T, APIError> {
        return Future { [self] promise in
            session.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let decodedResponse):
                        
                        promise(.success(decodedResponse))
                    case .failure:
                        
                        if let data = response.data, let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                            promise(.failure(apiError))
                        } else {
                            // Si no podemos decodificar un error específico, generamos un error genérico
                            let unknownError = APIError(code: 500, message: "Unknown error")
                            promise(.failure(unknownError))
                        }
                    }
                }
        }
        .eraseToAnyPublisher()
    }
    
}


