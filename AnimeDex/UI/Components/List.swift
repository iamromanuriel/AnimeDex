//
//  List.swift
//  AnimeDex
//
//  Created by Roman Uriel on 20/04/25.
//

import SwiftUI

struct ListAnimeTop: View{
    var onClick: () -> Void
    var animes: [DataBodyAnimeBasic]
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        HStack{
            Text("Top Anime")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(animes) { anime in
                    CardImage(imageUrl: anime.images?.jpg?.imageUrl)
                }
            }
        }
    }
}

struct ListCharacterTop: View {
    var onClick: () -> Void
    var characters: [DataBodyCharacterBasic]
    let rows = [GridItem(.flexible())]
    var body: some View {
        HStack{
            Text("Top Character")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(characters) { character in
                    CardImage(imageUrl: character.images?.jpg?.imageUrl)
                }
            }
        }
    }
}

struct ListProduces: View {
    var onClick: () -> Void
    var produces: [DataBodyProducersBasic]
    let rows = [GridItem(.flexible())]
    var body: some View {
        
        HStack{
            Text("Producers")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: rows,
                spacing: 40
            ) {
                ForEach(produces) { produce in
                    ItemCircle(produce: produce)
                }
            }
        }
    }
}


struct ListEpisodes: View {
    var body: some View {
        HStack{
            Text("Episode")
                .font(.title2)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        
        LazyVGrid(columns: [GridItem(.flexible())]) {
            ForEach(1..<5){ index in
                ItemEpisode()
            }
        }
    }
}


#Preview {
    ZStack{
        ListEpisodes()
    }
    .background(.black)
    
}
