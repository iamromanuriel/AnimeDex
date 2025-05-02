//
//  EpisodeRepository.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/04/25.
//
import Combine

class EpisodeRepository{
    private let api: Api
    init(api: Api) {
        self.api = api
    }
    
    func getEpisodes(id: String) -> AnyPublisher<ResponseBody<[EpisodeResponse]>, APIError>{
        let url = "https://api.jikan.moe/v4/anime/\(id)/episodes"
        
        return api.request(url: url)
    }
}
