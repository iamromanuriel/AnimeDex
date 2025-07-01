//
//  AnimeDexApp.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

import SwiftUI
import Alamofire

@main
struct AnimeDexApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct MainTabView: View {
    let onNavigateToRoute: (AppRoute) -> Void

    var body: some View {
        TabView {
            NavigationStack {
                HomeScreen(
                    onClickAnime: { id in
                        onNavigateToRoute(.detail(id))
                    },
                    onClickCharacter: { id in
                        onNavigateToRoute(.detailCharacter(id))
                    }
                )
                .background(.black)
            }
            .tabItem {
                Label("Inicio", systemImage: "house.fill")
            }

            NavigationStack {
                SearchScreen()
            }
            .tabItem {
                Label("Buscar", systemImage: "magnifyingglass")
            }

            NavigationStack {
                ProfileScreen()
            }
            .tabItem {
                Label("Perfil", systemImage: "person.crop.circle.fill")
            }
        }
    }
}


