//
//  Character.swift
//  AnimeDex
//
//  Created by Roman Uriel on 24/01/25.
//

struct DataBodyCharacterBasic: Identifiable, Decodable {
    let mal_id: Int?
    let url: String?
    let images: ImagesResponse?
    let name: String?
    let about: String?
    
    var id: Int {
        return mal_id ?? -1
    }
}

struct DataBodyCharacterByAnime: Decodable{
    let characters: [DataBodyCharacterBasic]
    let role: String?
}

struct DataBodyCharacterInfoByAnime: Decodable{
    let character: DataBodyCharacterBasic
    let role: String?
}
