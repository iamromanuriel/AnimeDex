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
        let url  = "https://api.jikan.moe/v4/top/characters"
        
        
        AF.request(url, method: .get)
            .responseDecodable(of: (ResponseBody<DataBodyCharacterBasic>.self)) { response in
                switch response.result {
                case .success(let value):
                    let listMaild = value.data.map(\.self.images)
                    print("Success: \(listMaild)")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
