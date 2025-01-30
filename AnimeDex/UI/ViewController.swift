//
//  ViewController.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//
import Alamofire
import UIKit
import Combine

class ViewController: ObservableObject {
    private let animeRepository: AnimeRepository
    private var cancellables = Set<AnyCancellable>()
    
    init (userRepository: AnimeRepository = AnimeRepository(api: Api.shared)) {
        self.animeRepository = userRepository
        
    }
    
    func fetchData()  {
        print("initGetApi");
        
        animeRepository.getTopAnimes()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let anime):
                    print(anime)
                case .finished: break
                }
            }, receiveValue: { response in
                print(response)
            }).store(in: &cancellables)
    }
}

/**
 
 import UIKit
 import Alamofire

 class CharacterViewController: UIViewController {
     @IBOutlet weak var tableView: UITableView!
     var characters: [Character] = []
     var isLoading = false
     var errorMessage: String?

     override func viewDidLoad() {
         super.viewDidLoad()
         fetchData()
     }

     func fetchData() {
         isLoading = true
         Task {
             do {
                 let fetchedCharacters = try await fetchCharacters()
                 self.characters = fetchedCharacters
                 self.tableView.reloadData()
             } catch {
                 self.errorMessage = "Failed to load characters: \(error.localizedDescription)"
             }
             self.isLoading = false
         }
     }

     private func fetchCharacters() async throws -> [Character] {
         let url = "https://api.example.com/characters"
         return try await AF.request(url, method: .get)
             .validate()
             .serializingDecodable([Character].self)
             .value
     }
 }

 */
