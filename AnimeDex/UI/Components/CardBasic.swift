//
//  CardBasic.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//
import SwiftUI

struct CardBasic: View {
    var body: some View {
    
        ZStack {
            ZStack {
                AsyncImage(url: URL(string: "https://cdn.myanimelist.net/images/anime/10/18793.jpg"))
                    .aspectRatio(contentMode: .fit)
            }
            LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
            VStack(alignment: .leading) {
                ReferenceItem()
                Text("Title")
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
    CardBasic()
}
