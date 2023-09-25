//  /*
//
//  Project: CircularProgressBar
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.09.2023
//
//  */

import SwiftUI

class TimeManager: ObservableObject {
    @Published var displayedValue = 0.0
    @Published var showvalue = false
    
    var value = 0.75
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
            if showvalue {
                if displayedValue < self.value {
                    self.displayedValue += 0.01
                } else {
                    timer.invalidate()
                }
            }  else {
                if self.displayedValue > 0 {
                    self.displayedValue -= 0.01
                } else {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ContentView: View {
    //        @State var value = 0.0
    //        @State var showvalue = false
    //        @State var displayedValue = 0.0
    
    @ObservedObject var tm = TimeManager()
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            
            Circle()
                .stroke(lineWidth: 0.35)
                .frame(width: 175, height: 175)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.1), Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
                .overlay {
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 2)
                        .blur(radius: 5)
                        .mask {
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.white, Color.clear]),
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                        }
                }
            
            Circle()
                .trim(from: 0, to: tm.showvalue ? tm.value : 0)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            NumProgress(displayedValue: tm.displayedValue, color: .black)
        }
        .onTapGesture {
            withAnimation(.spring().speed(0.1)) {
                tm.showvalue.toggle()
                tm.startTimer()
            }
        }
    }
}

//    #Preview {
//        ContentView()
//    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimeManager())
    }
}

struct NumProgress: View {
    var displayedValue = 0.0
    var color : Color
    
    var body: some View {
        
        Text("\(Int(displayedValue * 100))%")
            .bold()
            .font(.system(size: 30,
                          weight: .bold,
                          design: .rounded))
            .foregroundStyle(color)
    }
}

