//
//  DetailCharacterScreen.swift
//  AnimeDex
//
//  Created by Roman Uriel on 04/05/25.
//
import SwiftUI

struct DetailCharacterScreen: View {
    let characterId: Int
    @StateObject var viewModel: DetailCharacterViewModel
    
    init( characterId: Int) {
        self.characterId = characterId
        _viewModel = StateObject(wrappedValue: DetailCharacterViewModel( characterId: characterId))
    }
    
    var body: some View {
        ScrollView {
            ImageDetail(
                imageUrl: viewModel.character?.images?.jpg?.largeImageUrl ??
                viewModel.character?.images?.jpg?.imageUrl ?? "",
                title: viewModel.character?.name ?? "")
            
            
            
            Text(viewModel.character?.about ?? "")
                .foregroundColor(.white)
                .padding()
        }
        .navigationTitle(viewModel.character?.name ?? "")
        .background(.black)
        
        
    }
}

#Preview {
    DetailCharacterScreen(characterId: 23)
}
