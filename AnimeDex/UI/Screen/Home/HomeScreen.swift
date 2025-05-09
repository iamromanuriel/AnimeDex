//
//  Home.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var currentIndex: UUID = UUID()
    let onClickAnime: (Int) -> Void
    let onClickCharacter: (Int) -> Void
    
    let colores: [Color] = [.red, .blue, .green, .yellow, .orange]
    let skateSize: CGSize = .init(width: 72, height: 300)
    var body: some View {
        VStack{
            ScrollView(){
                TabView(selection: $currentIndex){
                    ForEach(viewModel.recommendedAnimes){ anime in
                        ItemCarousel(
                            anime: anime,
                            onClick: {id in
                                onClickAnime(id)
                            }
                        ).tag(anime.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 600)
                
                
                ListAnimeTop(
                    onClick: { id in
                        onClickAnime(id)
                    },
                    animes: viewModel.topAnimes
                )
                
                ListCharacterTop(
                    onClick: { id in
                        onClickCharacter(id)
                    },
                    characters: viewModel.topCharacters
                )
                
                ListProduces(
                    onClick: {}, produces: viewModel.producers
                )
            }
        }
    }
       
}




@ViewBuilder private func drawsateBoard(title: String, color: Color) -> some View {
    UnevenRoundedRectangle(topLeadingRadius: 48, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 48, style: .circular)
        .fill(color.gradient)
        .frame(width: 70, height: 300)
        .overlay{
            Text(title)
                .font(.system(size: 56, weight: .bold, design: .rounded))
                .fixedSize()
                .rotationEffect(.degrees(-45))
                .foregroundStyle(.gray.gradient)
                .blendMode(.multiply)
        }.clipped()
}


struct ColorDemoModel: Identifiable, Hashable, Sendable {
    let id: UUID = .init()
    let title: String
    let summery: String
    let color: Color
    
    static let allItems: [ColorDemoModel] = [
        ColorDemoModel(title: "Red", summery: "A bold color", color: .red),
        ColorDemoModel(title: "Green", summery: "A refreshing color", color: .green),
        ColorDemoModel(title: "Blue", summery: "A calming color", color: .blue),
        ColorDemoModel(title: "Yellow", summery: "A cheerful color", color: .yellow),
        ColorDemoModel(title: "Purple", summery: "A mysterious color", color: .purple),
        ColorDemoModel(title: "Orange", summery: "A vibrant color", color: .orange),
        ColorDemoModel(title: "Pink", summery: "A soft and feminine color", color: .pink)
    ]
}



struct AutoScroller: View{
    var topAnimes: [DataBodyAnimeBasic]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack{
            Color.secondary.ignoresSafeArea()
            
            TabView(selection: $selectedIndex){
                ForEach(topAnimes){ anime in
                    CardImage(
                        imageUrl: anime.images?.jpg?.imageUrl,
                        id: anime.id,
                        onClick: {id in
                            
                        }
                    )
                }
            }.frame(height: 400)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            
        }
    }
}



#Preview {
    HomeScreen(
        onClickAnime: {id in},
        onClickCharacter: { id in}
    )
}
