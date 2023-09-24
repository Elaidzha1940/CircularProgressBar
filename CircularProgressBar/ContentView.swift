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
    @State var value = 0.0
    @State var showvalue = false
    @State var displayedValue = 0.0
    
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            
            Circle()
                .stroke(lineWidth: 0.35)
                .frame(width: 1750, height: 175)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.1), Color.clear]),
                                                startPoint: .bottomLeading,
                                                endPoint: .topLeading))
                .overlay {
                    Circle()
                        .stroke(.black.opacity(0.1), lineWidth: 2)
                        .blur(radius: 5)
                        .mask {
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]),
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                        }
                }
            
            Circle()
                .trim(from: 0, to: showvalue ? value : 0)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            NumProgress(displayedValue: displayedValue, color: .black)
        }
        .onTapGesture {
            withAnimation(.spring().speed(0.2)) {
                showvalue.toggle()
                if showvalue {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        if displayedValue < value {
                            displayedValue  += 0.01
                            
                        } else {
                            timer.invalidate()
                        }
                    }
                    
                } else {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        if displayedValue > 0 {
                            displayedValue -= 0.01
                        } else {
                            timer.invalidate()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct NumProgress: View {
    var displayedValue = 0.0
    var color : Color
    var body: some View {
        Text("\(Int(displayedValue * 100))").bold()
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(color)
    }
}

