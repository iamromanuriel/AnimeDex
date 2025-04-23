//
//  Home.swift
//  AnimeDex
//
//  Created by Roman Uriel on 23/01/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var scrollPosition: ScrollPosition = .init(idType: DataBodyAnimeBasic.ID.self)
    @State private var currentIndex: UUID = UUID()
    let colores: [Color] = [.red, .blue, .green, .yellow, .orange]
    let skateSize: CGSize = .init(width: 72, height: 300)
    var body: some View {
        VStack{
            ScrollView(){
                TabView(selection: $currentIndex){
                    ForEach(viewModel.recommendedAnimes){ anime in
                        ItemCarousel(anime: anime).tag(anime.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 600)
                .onAppear(){
                    viewModel.loadRecommendedAnimes()
                }
                
                ListAnimeTop(
                    onClick: {},
                    animes: viewModel.topAnimes
                ).onAppear{
                    viewModel.loadTopAnimes()
                }
                
                ListCharacterTop(
                    onClick: {  },
                    characters: viewModel.topCharacters
                ).onAppear{
                    viewModel.loadTopCharacters()
                }
                
                ListProduces(
                    onClick: {}, produces: viewModel.producers
                ).onAppear{
                    viewModel.loadAnimeDetail()
                }
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
                    CardImage(imageUrl: anime.images?.jpg?.imageUrl)
                }
            }.frame(height: 400)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            
        }
    }
}



#Preview {
    HomeScreen()
}
