//
//  ContentView.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/14.
//

// swiftUI view files declare a structure and a preview
// structure confirms to the View protocol and describes the view's content and layout
import SwiftUI

struct ContentView: View {
    // body only return a single view, use stack which group views together horizontally, vertically
    var body: some View {
        
        
        LandmarkList()
            
        
        
    }
}

#Preview {
    // add the model object to the environment. which makes the object available to any subview
    ContentView()
        .environment(ModelData())
}
