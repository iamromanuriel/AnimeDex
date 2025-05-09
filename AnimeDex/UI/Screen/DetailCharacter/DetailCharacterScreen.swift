//
//  DetailCharacterScreen.swift
//  AnimeDex
//
//  Created by Roman Uriel on 04/05/25.
//
import SwiftUI

struct DetailCharacterScreen: View {
    var characterId: Int?
    var body: some View {
        ScrollView {
            ImageDetail(imageUrl: "", title: "")
        }
        
        
    }
}

#Preview {
    DetailCharacterScreen()
}
