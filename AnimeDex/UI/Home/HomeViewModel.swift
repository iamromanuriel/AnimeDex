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
    private let characterRepository: CharacterRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var topAnimes: [DataBodyAnimeBasic] = []
    @Published var topCharacters: [DataBodyCharacterBasic] = []
    
    init(animeRepository: AnimeRepository = AnimeRepository(api: Api.shared), characterRepository: CharacterRepository = CharacterRepository(api: Api.shared)) {
        self.animeRepository = animeRepository
        self.characterRepository = characterRepository
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
                
                self.topAnimes = response.data
            }).store(in: &cancellables)
    }
    
    func loadTopCharacters() {
        characterRepository.getTopCharacters()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.topCharacters = response.data
            }).store(in: &cancellables)
    }
}
