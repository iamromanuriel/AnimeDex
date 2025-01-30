//
//  Home.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let animeRepository: AnimeRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var topAnimes: [DataBodyAnimeBasic] = []
    
    init(animeRepository: AnimeRepository = AnimeRepository(api: Api.shared)) {
        self.animeRepository = animeRepository
    }
    
    func loadTopAnimes() {
        animeRepository.getTopAnimes()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                print(response)
                self.topAnimes = response.data
            }).store(in: &cancellables)
    }
}
