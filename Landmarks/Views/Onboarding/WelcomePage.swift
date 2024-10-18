//
//  OnboardingFlow.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/17.
//

import SwiftUI

/**
 a text view's default size is exactly enough to display its content
 a view default size is called its ideal size
 
 shapes don't have an ideal size, stretches to fill all availabel space. enclosing VStack increase its size to contain the shape.
 
 spacers extend as much as possible to fill empty space in the direction of their containing stack
 */

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
            Text("Welcome to MyApp")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
         
            
            Text("Description text a text view's default size is exactly enough to display its content")
                .multilineTextAlignment(.leading)
                .font(.title2)
         
        }
        .padding()
        
    }
}

#Preview {
    WelcomePage()
}
