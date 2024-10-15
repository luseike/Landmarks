//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/14.
//

import SwiftUI

// App protocol, body returns one or more scenes, which in turn provide content for display
// @main identifies the app's entry point
@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            
            /// put the model object in the environment when you run the app in the simulator or on a device
            ContentView()
                .environment(modelData)
        }
    }
}
