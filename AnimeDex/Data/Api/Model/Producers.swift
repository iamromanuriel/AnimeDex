//
//  Producers.swift
//  AnimeDex
//
//  Created by Roman Uriel on 21/04/25.
//



struct DataBodyProducersBasic: Identifiable, Decodable {
    var mal_id: Int?
    var titles: [TitleResponse]
    var images: ImagesResponse?
    
    var id: Int {
        return mal_id ?? -1
    }
}

struct TitleResponse: Decodable {
    let type: String?
    let title: String?
}
