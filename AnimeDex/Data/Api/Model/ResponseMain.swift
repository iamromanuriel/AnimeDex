//
//  ResponseMain.swift
//  AnimeDex
//
//  Created by Roman Uriel on 24/01/25.
//

struct ResponseBody< T: Decodable >: Decodable {
    let data: [T]
}
