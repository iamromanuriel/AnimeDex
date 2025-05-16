//
//  SearchScreen.swift
//  AnimeDex
//
//  Created by Roman Uriel on 12/05/25.
//
import SwiftUI

struct SearchScreen: View {
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    
                    LazyVGrid(columns: [GridItem()]){
                        ForEach(1..<15){_ in
                            ItemResultSearch()
                        }
                    }.navigationTitle(Text("Search"))
                }
            }
            
        }
        
        
    }
}

#Preview {
    SearchScreen()
}
