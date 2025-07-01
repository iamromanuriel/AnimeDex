//
//  SearchScreen.swift
//  AnimeDex
//
//  Created by Roman Uriel on 12/05/25.
//
import SwiftUI

struct SearchScreen: View {
    @State private var search: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack{
            
                
                HStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $search)
                            .focused($isFocused)
                            .onSubmit{
                                print("Action ")
                            }
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }.padding(.horizontal, 8)
                
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
