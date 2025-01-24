//
//  ViewController.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//
import Alamofire
import UIKit

class ViewController: ObservableObject {
    
    
    func fetchData()  {
        let url  = "https://api.jikan.moe/v4/anime/19/full"
        print(url)
        
        AF.request(url, method: .get)
            .responseDecodable(of: AnimeBody.self) { response in
                switch response.result {
                case .success(let value):
                    print("Success: \(value)")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
