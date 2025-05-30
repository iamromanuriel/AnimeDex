//
//  CharacterRepository.swift
//  AnimeDex
//
//  Created by Roman Uriel on 30/01/25.
//

import Combine

class CharacterRepository {
    private let api: Api
    
    init(api: Api){
        self.api = api
    }
    
    func getTopCharacters() -> AnyPublisher<ResponseBody<[DataBodyCharacterBasic]>, APIError>{
        let url = "https://api.jikan.moe/v4/top/characters"
        
        return api.request(url: url)
            
    }
    
    func getCharacterByIdAnime(idAnime: String) -> AnyPublisher<ResponseBody<[DataBodyCharacterInfoByAnime]>, APIError>{
        let url = "https://api.jikan.moe/v4/anime/\(idAnime)/characters"
        return api.request(url: url)
    }
    
    func getCharacterById(idCharacter: String) -> AnyPublisher<ResponseBody<DataBodyCharacterBasic>, APIError>{
        let url = "https://api.jikan.moe/v4/characters/\(idCharacter)"
        return api.request(url: url)
    }
}
