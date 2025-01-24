//
//  ContentView.swift
//  AnimeDex
//
//  Created by Roman Uriel on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewController = ViewController()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }.onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
