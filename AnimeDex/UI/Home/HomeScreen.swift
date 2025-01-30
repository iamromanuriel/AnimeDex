//
//  Home.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        VStack {
            List(viewModel.topAnimes) { anime in
                Text(anime.title ?? "")
            }
        }.onAppear {
            viewModel.loadTopAnimes()
        }
        
    }
}

#Preview {
    HomeScreen()
}
