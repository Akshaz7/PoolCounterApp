//
//  ContentView.swift
//  L1 Demo
//
//  Created by Akshat Thapa on 15/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.black).ignoresSafeArea()
            
            VStack {
                
                Image("niagarafalls")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                Text("Niagara Falls").font(.largeTitle)
                    .fontWeight(.semibold).foregroundColor( Color(.white))
                
            }
            
        }

    }
}

#Preview {
    ContentView()
}
