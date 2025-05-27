//
//  ContentView.swift
//  Xcode Demo
//
//  Created by Akshat Thapa on 15/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Tap Me") {
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
