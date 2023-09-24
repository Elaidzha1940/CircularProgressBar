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
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("dark"))
    }
}

#Preview {
    BlackProgress()
        .environmentObject(TimeManager())
}
