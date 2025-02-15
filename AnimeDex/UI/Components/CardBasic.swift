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
    let title: String?
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imageUrl ?? ""))
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
        }.clipped()
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



#Preview {
    CardImage(
        imageUrl: "https://cdn.myanimelist.net/images/anime/1208/94745.jpg",
        title: "Full metal alquimist")
}
