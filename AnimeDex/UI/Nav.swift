//
//  Nav.swift
//  AnimeDex
//
//  Created by Roman Uriel on 24/04/25.
//

import SwiftUI

enum AppRoute:Hashable{
    case home
    case detail(Int)
    case detailCharacter(Int)
}


struct Navigation: View{
    
    @State private var navigationPath = NavigationPath()
    let onClickAnime: (Int) -> Void
    let onClickCharacter: (Int) -> Void
    
    var body: some View{
        ZStack{
            
            
            NavigationStack(path: $navigationPath){
                
                
            }
        }
    }
}

struct RootView: View {
    @State private var currentRoute: AppRoute? = nil

    var body: some View {
        ZStack {
            if currentRoute == nil {
                MainTabView(onNavigateToRoute: { route in
                    currentRoute = route
                })
            } else {
                NavigationStack {
                    switch currentRoute {
                    case .detail(let id):
                        DetailAnimeScreen(idAnime: id)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button("Volver") {
                                        currentRoute = nil
                                    }
                                }
                            }

                    case .detailCharacter(let id):
                        DetailCharacterScreen(characterId: id)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button("Volver") {
                                        currentRoute = nil
                                    }
                                }
                            }

                    case .home, .none:
                        EmptyView()
                    }
                }
            }
        }
    }
}


struct ProfileTabView: View {
    var body: some View {
        NavigationView {
            Text("Pantalla de Perfil")
                .navigationTitle("Perfil")
        }
        
    }
}

#Preview {
    Navigation(
        onClickAnime: {id in}, onClickCharacter: {id in}
    )
}

