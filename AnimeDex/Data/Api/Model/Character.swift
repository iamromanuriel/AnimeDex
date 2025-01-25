//
//  Character.swift
//  AnimeDex
//
//  Created by Roman Uriel on 24/01/25.
//

struct DataBodyCharacterBasic: Decodable {
    let mal_id: Int?
    let url: String?
    let images: ImagesResponse?
    let name: String?
    let about: String?
}
