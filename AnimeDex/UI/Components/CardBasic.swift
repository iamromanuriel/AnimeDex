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
            .onTapGesture {
                print("onClick Item")
            }
            
        }
        .frame(width: 150, height: 250)
        .background(Color.accentColor)
        .cornerRadius(10)
        .onTapGesture {
            print("onClick Item")
        }
        
    }
}


struct CardImage: View {
    let imageUrl: String?
    let id: Int?
    let onClick: (Int) -> Void
    
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
        .onTapGesture {
            onClick(id ?? 0)
        }
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
    var onClick: (Int) -> Void
    
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
            .onTapGesture {
                onClick(anime.entry.last?.id ?? 0)
            }
    }
}


struct ImageDetail: View {
    var imageUrl: String
    var title: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
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
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
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

struct ImageYoutubePreview: View{
    var imageUrl: String
    var body: some View{
        
        ZStack{
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipped()
            } placeholder: {
                Color.gray
            }
            
            Image(systemName: "play.rectangle.fill")
                .foregroundColor(.red)
                
        }
        .cornerRadius(10)
        .clipped()
        
    }
}

struct CollectionCard: View {
    var body : some View{
        VStack{
            Text("12").padding(.vertical, 30).foregroundColor(.white)
            Spacer()
            Text("A recomendar").padding(.vertical, 10).foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(Color.gray.opacity(0.6))
        .cornerRadius(10)
        .clipped()
    }
}

#Preview {
    CollectionCard()
}
