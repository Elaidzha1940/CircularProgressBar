//
//  BlackProgress.swift
//  CircularProgressBar
//
//  Created by Elaidzha Shchukin on 25.09.2023.
//

import SwiftUI

struct BlackProgress: View {
    @ObservedObject var tm = TimeManager()
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200, height: 175)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.07), Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
                .offset(x: -10, y: -10)
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200, height: 200)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.clear,.black.opacity(0.7)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
                .offset(x: 8, y: 8)

            Circle()
                .stroke(lineWidth: 30)
                .frame(width: 200, height: 200)
                .foregroundColor(Color("dark"))
                //.shadow(color: .black.opacity(0.1), radius: 10, x: -10, y: 10)
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 150, height: 150)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.clear,.white.opacity(0.1)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("dark"))
    }
}

#Preview {
    BlackProgress()
        .environmentObject(TimeManager())
}
