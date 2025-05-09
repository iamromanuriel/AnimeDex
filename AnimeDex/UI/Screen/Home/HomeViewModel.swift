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
    private let producersRepository: ProducersRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var topAnimes: [DataBodyAnimeBasic] = []
    @Published var topCharacters: [DataBodyCharacterBasic] = []
    @Published var recommendedAnimes: [DataBodyAnimeRecommendation] = []
    @Published var producers: [DataBodyProducersBasic] = []
    
    init(
        animeRepository: AnimeRepository = AnimeRepository(api: Api.shared),
        characterRepository: CharacterRepository = CharacterRepository(api: Api.shared),
        producerRepository: ProducersRepository = ProducersRepository(api: Api.shared)
    ) {
        self.animeRepository = animeRepository
        self.characterRepository = characterRepository
        self.producersRepository = producerRepository
        
        loadRecommendedAnimes()
        loadTopAnimes()
        loadTopCharacters()
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
                    print("Error : \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.topCharacters = response.data
            }).store(in: &cancellables)
    }
    
    func loadRecommendedAnimes() {
        animeRepository.getRecommendedAnimes()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error recommended: \(error)")
                case .finished:
                break
                }
               
            }, receiveValue: { response in
                self.recommendedAnimes = response.data
            }).store(in: &cancellables)
    }
    
    func loadProducers() {
        producersRepository.getProducers()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error producers: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.producers = response.data
            }).store(in: &cancellables)
    }
    
    func loadCharacterById(){
        characterRepository.getCharacterById(idCharacter: "19")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error charactersById: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                    print("ResponseCharacter : \(response)")
            }).store(in: &cancellables)
    }
    
}
