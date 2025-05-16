//
//  LazyItem.swift
//  AnimeDex
//
//  Created by Roman Uriel on 05/02/25.
//

import SwiftUI


struct ItemCharacterCircle: View {
    let urlImage: String
    let title: String
    var body: some View {
        VStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 200, height: 200)
                .overlay(content: {
                    AsyncImage(url: URL(string: urlImage)!)
                        .clipShape(.circle)
                })
            Text(title).padding(.top)
        }
        
    }
}

struct ItemListCharacter: View{
    var body: some View {
        HStack(){
            Text("H")
                .frame(width: 30, height: 30)
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(.circle)
                .padding()
            VStack(alignment:.leading){
                Text("Elemento")
                Text("Subelemento")
            }
            
            
        }
        .frame(maxWidth:.infinity)
        .background(Color.blue)
    }
}

struct ExampleAlign: View {
    var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .topLeading) {
                    
                    VStack {
                        Spacer()
                        Text("Contenido del vstack")
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.gray)

                    HStack {
                        Spacer()
                        Text("Esquina Superior Derecha")
                            .padding()
                    }
                    .frame(width: geometry.size.width, alignment: .topTrailing) // Corregido aquí
                }
            }
        }
}

struct ItemCircle: View {
    let produce: DataBodyProducersBasic
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: produce.images?.jpg?.imageUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .background(.gray)
                    .clipped()
            } placeholder: {
                Color.gray
                    .frame( height: 100)
            }
            
            Text(produce.titles.first?.title ?? "").padding()
        }
        
    }
}


struct ItemEpisode: View {
    var episode: EpisodeResponse?
    var body: some View {
        VStack{
            HStack{
                Text(episode?.title ?? "")
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Text(episode?.aired ?? "")
                    .foregroundColor(.white)
                    
            }
            
            HStack{
                Text(String(episode?.score ?? 0))
                    .foregroundColor(.white)
                Spacer()
                Text("The Journey's End")
                    .foregroundColor(.white)
            }
        }.padding()
    }
}

struct ItemResultSearch: View {
    var body: some View {
        
        HStack{
            ZStack(alignment:.bottomTrailing){
                AsyncImage(url: URL(string: "https://cdn.myanimelist.net/images/anime/4/78280.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:50,height: 50)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } placeholder: {
                    Color.gray
                        .frame( height: 100)
                }
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .padding(3)
            }.padding()
            
            VStack(
                alignment: HorizontalAlignment.leading
            ){
                Text("Boruto")
                    .font(.title3)
                    .bold()
                Text("217 cap")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
        }.frame(maxWidth: .infinity)
            
    }
}

#Preview {
    HStack{
        ItemResultSearch()
    }
    
}

