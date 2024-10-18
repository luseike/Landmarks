//
//  DiceView.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/17.
//

import SwiftUI

// resizable modifier tells the image it can stretch to fill any available space

/**
 All apps have data, or state, that changes over time. When an app changes state, it may need to update its interface.
 
 however, SwiftUI doesn't monitor every propery in an app by default
 
 mark the property with the keyword @State
 */

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
            .frame(maxWidth: 100, maxHeight: 100)
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
                
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
