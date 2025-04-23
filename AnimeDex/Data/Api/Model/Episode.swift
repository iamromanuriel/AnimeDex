//
//  Episode.swift
//  AnimeDex
//
//  Created by Roman Uriel on 21/04/25.
//

struct EpisodeResponse:Identifiable, Decodable {
    let mal_id: Int?
    let score: Double?
    let title_romanji: String?
    let forum_url: String?
    let title: String?
    let title_japanese: String?
    let aired: String?
    
    var id: Int{
        return mal_id ?? -1
    }
}
