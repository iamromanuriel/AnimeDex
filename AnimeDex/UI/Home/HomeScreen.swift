//
//  Home.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    let colums = [GridItem(.fixed(30))]
    @State private var selectedIndex = 0
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: colums){
                ForEach(viewModel.topAnimes) { anime in
                    CardBasic(anime: anime, character: nil)
                }
            }
        }.onAppear{
            viewModel.loadTopAnimes()
        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: colums){
                ForEach(viewModel.topCharacters) { character in
                    CardBasic(anime: nil, character: character)
                }
            }
        }.onAppear{
            viewModel.loadTopCharacters()
        }
        
    }
    
}


#Preview {
    HomeScreen()
}
