//
//  Controllers.swift
//  AnimeDex
//
//  Created by Roman Uriel on 16/05/25.
//

import SwiftUI



struct SelectorSearch: View{
    @Binding var type: TypeDetail
        var body: some View {
            HStack{
                ZStack{
                    Text("Anime")
                        .foregroundColor(type == .Anime ? Color.white : Color.gray)
                        .padding(6)
                }
                .frame(maxWidth: .infinity)
                .background( type == .Anime ? Color.gray : Color.clear )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture {
                    withAnimation (.linear(duration: 0.3)){
                        type = TypeDetail.Anime
                    }
                }
                
                HStack{
                    ZStack{
                        Text("Personaje")
                            .foregroundColor(type == .Character ? Color.white : Color.gray)
                            .padding(6)
                    }
                    .frame(maxWidth: .infinity)
                    .background(type == .Character ? Color.gray : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            type = TypeDetail.Character
                        }
                }
            }
    }
}


struct CallSelectorSearch: View {
    @State private var type: TypeDetail = .Anime
    @FocusState private var isFocused: Bool
    @State var text: String = ""
    var body: some View {
        VStack{
            
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(6)
                        
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $text)
                        .focused($isFocused)
                        .padding(.vertical, 8)
                    
                    
                }
                
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
                
                Button(action:{
                    isFocused = false
                }){
                    Text("Cancelar")
                }.padding(8)
            }
            
            
            
                
            SelectorSearch(type: $type)
            
            
        }
        
    }
}

#Preview {
    CallSelectorSearch()
    
}
