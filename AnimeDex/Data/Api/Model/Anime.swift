//
//  Anime.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

struct AnimeBody: Decodable {
    let data: DataBody?
}

struct DataBody: Decodable {
    let mal_id: Int?
    let url: String?
    let approved: Bool?
    let title: String?
}
