//
//  LazyItem.swift
//  AnimeDex
//
//  Created by Roman Uriel on 05/02/25.
//

import SwiftUI


struct ItemCharacterCircle: View {
    var body: some View {
        ZStack {
            
            AsyncImage(url: URL(string: "https://cdn.myanimelist.net/images/anime/1208/94745.jpg")!)
                
        }.frame(width: 100, height: 100)
        
    }
}

#Preview {
    ItemCharacterCircle()
}
