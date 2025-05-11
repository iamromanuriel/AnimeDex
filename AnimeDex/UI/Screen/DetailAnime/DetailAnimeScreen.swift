//
//  DetailAnimeScreen.swift
//  AnimeDex
//
//  Created by Roman Uriel on 05/03/25.
//

import SwiftUI

struct DetailAnimeScreen : View {
    let idAnime: Int
    @StateObject var viewModel : DetailAnimeViewModel
    
    init(idAnime: Int){
        self.idAnime = idAnime
        _viewModel = StateObject(wrappedValue: DetailAnimeViewModel(idAnime: idAnime))
    }
    
    var body: some View {
        ScrollView {
            ImageDetail(imageUrl: viewModel.animeDetail?.images?.jpg?.largeImageUrl ?? "",
                        title: viewModel.animeDetail?.title ?? ""
            )
                
            
            HStack(
                spacing: 40
            ){
                Text(String(viewModel.animeDetail?.year ?? 0))
                    .font(.caption)
                    .foregroundColor(.white)
                
                HStack{
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    Text(viewModel.animeDetail?.status ?? "")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                Text(viewModel.animeDetail?.type ?? "")
                    .font(.caption)
                    .foregroundColor(.white)
                    .bold()
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            Text(viewModel.animeDetail?.synopsis ?? "")
                .font(.body)
                .foregroundColor(.white)
                .padding(.horizontal,6)
            
            HStack{
                Text("Donde ver:").font(.caption2).foregroundColor(.white).bold()
                Text(viewModel.animeDetail?.licensors?.first?.name ?? "").font(.caption2).foregroundColor(.white)
                Spacer()
            }
            .padding(6)
            
            HStack{
                Text("Capitulos").font(.caption2).foregroundColor(.white).bold()
                Text(String(viewModel.animeDetail?.episodes ?? 0)).font(.caption2).foregroundColor(.white)
                Spacer()
            }
            .padding(6)
            
            if let imageTriler = viewModel.animeDetail?.trailer?.images?.jpg?.largeImageUrl{
                ImageYoutubePreview(imageUrl: imageTriler)
                    .frame(width: 200, height: 200)
            }
            
            
            
            ListEpisodes(episodes: viewModel.episodes)
                .onAppear{
                    viewModel.loadEpisodes()
                }
            
            ListCharacterTop(onClick: { id in }, characters: viewModel.characters ?? [])
                .onAppear{
                    viewModel.loadCharacter()
                }
            
        }
        .navigationTitle(viewModel.animeDetail?.title ?? "")
        .background(.black)
        
    }
}



#Preview {
    DetailAnimeScreen(idAnime: 22)
}
