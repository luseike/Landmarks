//
//  DiceContent.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/17.
//

import SwiftUI

struct DiceContent: View {
    @State private var numberOfDice = 1
    
    var body: some View {
        VStack {
            
            
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps().bold())
            
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                    
                }
                .disabled(numberOfDice == 1)
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                    
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        // The .tint modifier only affects views that rely on the accent color - typically controls such as buttons and toggles
        .tint(.white)
    }
}

#Preview {
    DiceContent()
}
