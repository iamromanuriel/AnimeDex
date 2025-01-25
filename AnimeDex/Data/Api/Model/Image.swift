//
//  Image.swift
//  AnimeDex
//
//  Created by Roman Uriel on 24/01/25.
//

/***
 * Struct for manage Images multiple format
 */

struct ImagesResponse: Decodable {
    let jpg: ImageFormat?
    let webp: ImageFormat?
}

struct ImageFormat: Decodable {
    let imageUrl: String?
    let smallImageUrl: String?
    let largeImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case smallImageUrl = "small_image_url"
        case largeImageUrl = "large_image_url"
    }
}
