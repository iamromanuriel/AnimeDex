//
//  Producers.swift
//  AnimeDex
//
//  Created by Roman Uriel on 21/04/25.
//

import Combine

class ProducersRepository {
    private let api: Api
    
    init(api: Api) {
        self.api = api
    }
    
    func getProducers() -> AnyPublisher<ResponseBody<[DataBodyProducersBasic]>, APIError> {
        let url = "https://api.jikan.moe/v4/producers"
        
        return api.request(url: url)
    }
}
