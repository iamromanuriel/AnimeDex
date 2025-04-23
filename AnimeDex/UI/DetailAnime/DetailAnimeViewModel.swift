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
    private var cancellables: Set<AnyCancellable> = []
    @Published var animeDetail: DataBodyAnimeDetail?
    
    
    init(animeRepository: AnimeRepository = AnimeRepository(api: Api.shared), episodeRepository: EpisodeRepository = EpisodeRepository(api: Api.shared)) {
        self.animeRepository = animeRepository
        self.episodeRepository = episodeRepository
    }
    
    func loadAnimeDetail(){
        animeRepository.getAnimeDetail(id:"52991")
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
        episodeRepository.getEpisodes(id:"52991")
            .sink(receiveCompletion: { completation in
                switch completation {
                case .failure(let error):
                    print("Error detail: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: {response in
                print(response)
                
            }).store(in: &cancellables)
    }
}
