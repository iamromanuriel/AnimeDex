//
//  DetailAnimeViewModel.swift
//  AnimeDex
//
//  Created by Roman Uriel on 05/03/25.
//

import Foundation
import Combine

class DetailAnimeViewModel: ObservableObject {
    
    private let animeRepository: AnimeRepository
    private let episodeRepository: EpisodeRepository
    private let characterRepository: CharacterRepository
    private var cancellables: Set<AnyCancellable> = []
    @Published var animeDetail: DataBodyAnimeDetail?
    @Published var episodes: [EpisodeResponse]?
    @Published var characters: [DataBodyCharacterBasic]?
    let idAnime: Int
    
    
    init(
        animeRepository: AnimeRepository = AnimeRepository(api: Api.shared),
        episodeRepository: EpisodeRepository = EpisodeRepository(api: Api.shared),
        characterRepository: CharacterRepository = CharacterRepository(api: Api.shared),
        idAnime: Int) {
        self.animeRepository = animeRepository
        self.episodeRepository = episodeRepository
        self.idAnime = idAnime
        self.characterRepository = characterRepository
        loadAnimeDetail()
    }
    
    func loadAnimeDetail(){
        animeRepository.getAnimeDetail(id:String(idAnime))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error detail: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                
                print(response)
                self.animeDetail = response.data
            }).store(in: &cancellables)
    }
    
    func loadEpisodes(){
        episodeRepository.getEpisodes(id:String(idAnime))
            .sink(receiveCompletion: { completation in
                switch completation {
                case .failure(let error):
                    print("Error detail: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: {response in
                //print(response)
                self.episodes = response.data
            }).store(in: &cancellables)
    }
    
    func loadCharacter(){
        characterRepository.getCharacterByIdAnime(idAnime: String(idAnime))
            .sink(receiveCompletion: { completation in
                switch completation {
                    case .failure(let error):
                    print("Error detail: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                let characterByAnime = response.data.map({$0.character})
                self.characters = characterByAnime
            }).store(in: &cancellables)
    }
}
