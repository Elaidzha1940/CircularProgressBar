//  /*
//
//  Project: CircularProgressBar
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.09.2023
//
//  */

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 1750, height: 175)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottomLeading, endPoint: .topLeading))
                .overlay {
                    Circle()
                        .stroke(.black.opacity(0.1), lineWidth: 2)
                        .blur(radius: 5)
                }

            
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
