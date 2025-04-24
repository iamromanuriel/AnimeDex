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
}


struct Navigation: View{
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View{
        NavigationStack(path: $navigationPath){
            HomeScreen(
                onClickAnime: { id in
                    navigationPath.append(AppRoute.detail(id))
                    print("onClickAnimeTop \(id)")
                }
            )
            .background(.black)
            .navigationDestination(for: AppRoute.self){ route in
                    switch route{
                    case .detail(let id):
                        DetailAnimeScreen(idAnime: id)
                        
                    case .home:
                        Text("")
                    }
                }
        }
    }
}

#Preview {
    Navigation()
}

