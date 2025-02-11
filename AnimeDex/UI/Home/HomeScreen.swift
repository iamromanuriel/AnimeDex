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
    let skateSize: CGSize = .init(width: 72, height: 300)
    var body: some View {
        VStack{
            GeometryReader{ proxy in
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: [GridItem()]){
                        ForEach(viewModel.topAnimes){ anime in
                            
                            CardImage(imageUrl: anime.images?.jpg?.imageUrl, title: anime.title)
                                .scrollTransition{ content, phase in
                                    content.scaleEffect(phase.isIdentity ? 1: 0.7)
                                }
                                .onTapGesture {
                                    print("tap", anime)
                                }
                        }
                    }.scrollTargetLayout()
                }
                .safeAreaPadding(.horizontal, max((proxy.size.width - skateSize.width) / 2, 0))
                .scrollTargetBehavior(.viewAligned)
                .foregroundColor(.red)
                .scrollPosition($scrollPosition, anchor: .center)
            }
            .onAppear(perform: viewModel.loadTopAnimes)
            .frame(height: skateSize.height)
            
            GeometryReader{ proxy in
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: [GridItem()]){
                        ForEach(viewModel.topCharacters){ character in
                            
                            CardImage(imageUrl: character.images?.jpg?.imageUrl, title: character.name)
                                .scrollTransition{ content, phase in
                                    content.scaleEffect(phase.isIdentity ? 1: 0.7)
                                }
                                .onTapGesture {
                                    print("tap", character)
                                }
                        }
                    }.scrollTargetLayout()
                }
                .safeAreaPadding(.horizontal, max((proxy.size.width - skateSize.width) / 2, 0))
                .scrollTargetBehavior(.viewAligned)
                .foregroundColor(.red)
                .scrollPosition($scrollPosition, anchor: .center)
            }
            .onAppear(perform: viewModel.loadTopCharacters)
            .frame(height: skateSize.height)
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
        ColorDemoModel(title: "Pink", summery: "A soft and feminine color", color: .pink),
        
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
                    CardImage(imageUrl: anime.images?.jpg?.imageUrl, title: anime.title)
                }
            }.frame(height: 600)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            
        }
    }
}


#Preview {
    HomeScreen()
}
