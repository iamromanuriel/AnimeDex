//
//  CardBasic.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//
import SwiftUI

struct CardBasic: View {
    let anime : DataBodyAnimeBasic?
    let character: DataBodyCharacterBasic?
    
    var body: some View {
        ZStack {
            ZStack {
                AsyncImage(url: URL(string: (anime?.images?.jpg?.imageUrl ?? character?.images?.jpg?.imageUrl) ?? ""))
                    .aspectRatio(contentMode: .fit)
            }
            LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
            VStack(alignment: .leading) {
                ReferenceItem()
                Text(anime?.title ?? character?.name ?? "")
                    .font(.headline)
                    .foregroundColor(.gray)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(contentMode: .fit)
            
        }
        .frame(width: 150, height: 250)
        .background(Color.accentColor)
        .cornerRadius(10)
    }
}


struct CardImage: View {
    let imageUrl: String?
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 250)
                    .clipped()
            } placeholder: {
                Color.gray
                    .frame(width: 180, height: 250)
            }

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.4), .clear]),
                startPoint: .topTrailing,
                endPoint: .leading
            )

            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
            }
        }
        .frame(width: 180, height: 250)
        .cornerRadius(16)
        .clipped()
    }
}



struct ReferenceItem: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 20, height: 30)
                
            Text("R")
                .foregroundColor(.white)
        }
        
    }
}

struct ItemCarousel: View {
    var anime: DataBodyAnimeRecommendation
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: anime.entry.last?.images?.jpg?.largeImageUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
            } placeholder: {
                Color.gray
                    .frame(height: 300)
            }
            
            VStack(alignment: .center) {
                
                Spacer()
                
                Text(anime.entry.last?.title ?? "")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                
                HStack{
                    ZStack(alignment: .trailing) {
                        
                        Text("Action").foregroundColor(.white).padding(4)
                    }
                    .background(Color.black.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    Text("1 temporada").foregroundColor(.white)
                }
                
                Text(anime.content ?? "")
                    .foregroundColor(.white).padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                }
            )
            
            
        }.frame(maxWidth: .infinity, maxHeight: 600)
    }
}





#Preview {
    CardImage(imageUrl: "https://cdn.myanimelist.net/images/anime/10/47347.jpg")
}
