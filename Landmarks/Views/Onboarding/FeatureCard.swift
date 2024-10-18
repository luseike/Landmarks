//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/17.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            Text(description)
            Spacer()
        }
        .padding()
//        .background(.tint, in: RoundedRectangle(cornerRadius: 12))
//        .opacity(0.48)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.48)
                .brightness(-0.24)   // 降低卡片背景亮度，来恢复对比度
        }
        .foregroundStyle(.white)
        
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left.")
}
