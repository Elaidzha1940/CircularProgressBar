//  /*
//
//  Project: CircularProgressBar
//  File: BlackProgress.swift
//  Created by: Elaidzha Shchukin
//  Date: 25.09.2023
//
//  */

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
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 150, height: 150)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.clear,.white.opacity(0.1)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 150, height: 150)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), .clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            
            Circle()
                .trim(from: 0, to: tm.showvalue ? tm.value : 0)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.white, Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            NumProgress(displayedValue: tm.displayedValue, color: .white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("dark"))
        .onTapGesture {
            withAnimation(.spring().speed(0.1)) {
                tm.showvalue.toggle()
                tm.startTimer()
            }
        }
    }
}

#Preview {
    BlackProgress()
        .environmentObject(TimeManager())
}
