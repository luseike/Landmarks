//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/14.
//

import SwiftUI

struct LandmarkList: View {
    
    /// and an @Environment propery wrapper to the view
    /// and an environment(_:) modifier to the preview
    /// 只要将environment(_:)修饰符应用于父级。modelData属性就会自动获取其值。environment(_:)修饰符会将数据传递到环境中
    @Environment(ModelData.self) var modelData
    
    /// always create state as private
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }
    var body: some View {
        
        
        
        /// NavigationSplitView offer navigtion ability to a View (in this is a list view)
        /// nesting each row in a NavigationLink to set up a transtition to a destination view
        NavigationSplitView {
            
            // pass array to the List initializer
            // Lists work with identifiable data. by passing along with your data a key path to a property that uniquely identifies each element
            // if data confirm to Identifiable, use landmark directly
            
            List {
                /// use the $ prefix to access a binding to a state variable
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                        
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
