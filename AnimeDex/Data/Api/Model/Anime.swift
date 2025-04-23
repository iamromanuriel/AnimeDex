//
//  Anime.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

import Foundation

/**
 * Strunct for body main (Touse only screen main)
 */

struct DataBodyAnimeBasic: Identifiable, Decodable{
    let mal_id: Int?
    let url: String?
    let images: ImagesResponse?
    let title: String?
    let type: String?
    let rank: Int?
    
    var id: Int {
        return mal_id ?? -1
    }
}


struct DataBodyAnimeRecommendation: Identifiable, Decodable {
    let mal_id: String?
    let entry: [DataBodyAnimeBasic]
    let content: String?
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case mal_id, entry, content
    }
}

struct DataBodyAnimeDetail: Identifiable, Decodable {
    let mal_id: Int?
    let duration: String?
    let synopsis: String?
    let year: Int?
    let licensors: [LicensorResponse]?
    let type: String?
    let trailer: TrailerResponse?
    let source: String?
    let episodes: Int?
    let status: String?
    let images: ImagesResponse?
    let title: String?
    
    var id: Int{
        return mal_id ?? -1
    }
}


struct LicensorResponse: Identifiable, Decodable {
    let mal_id: Int?
    let type: String?
    let name: String?
    let url: String?
    
    var id: Int{
        return mal_id ?? -1
    }
}

struct TrailerResponse:  Decodable {
    let youtube_id: String?
    let embed_url: String?
    let url: String?
    let images: ImagesResponse?
}
