//
//  DetailCharacterViewModel.swift
//  AnimeDex
//
//  Created by Roman Uriel on 04/05/25.
//

import Combine
import Foundation


class DetailCharacterViewModel: ObservableObject{
    private let characterRepository: CharacterRepository
    private var cancellables: Set<AnyCancellable> = []
    @Published var character: DataBodyCharacterBasic?
    let characterId: Int
    
    init (
        characterRepository: CharacterRepository = CharacterRepository(api: Api.shared),
        characterId: Int
    ) {
        self.characterRepository = characterRepository
        self.characterId = characterId
        loadCharacterById()
    }
    
    func loadCharacterById(){
        characterRepository.getCharacterById(idCharacter: String(characterId))
            .sink(receiveCompletion: { completation in
                switch completation {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.character = response.data
                print("Response Success :: \(response)")
            }).store(in: &cancellables)
    }
}
