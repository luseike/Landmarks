//
//  Onboarding.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/17.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop, .gradientBottom
]

struct Onboarding: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        // .page tab view style lets you swipe left and right ro changes views
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    Onboarding()
}
