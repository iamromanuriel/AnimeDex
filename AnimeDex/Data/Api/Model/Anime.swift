//
//  Anime.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

/**
 * Strunct for body main (Touse only screen main)
 */

struct DataBodyAnimeBasic: Identifiable, Decodable {
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
