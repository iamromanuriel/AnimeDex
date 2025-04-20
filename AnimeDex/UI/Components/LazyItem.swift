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

#Preview {
    ExampleAlign()
}

