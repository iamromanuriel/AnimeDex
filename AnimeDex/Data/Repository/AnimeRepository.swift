//
//  AnimeRepository.swift
//  AnimeDex
//
//  Created by Roman Uriel on 24/01/25.
//

import Combine

class AnimeRepository{
    private let api: Api
    
    init(api: Api) {
        self.api = api
    }
    
    func getTopAnimes() -> AnyPublisher<ResponseBody<[DataBodyAnimeBasic]>, APIError>{
        let url = "https://api.jikan.moe/v4/top/anime"
        
        return api.request(url: url)
    }
}
