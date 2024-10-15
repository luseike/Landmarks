//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/14.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        // using a Bindable wrapper. Embed the landmark's name
        @Bindable var modelData = modelData
        ScrollView {
            
            MapView(coordiante: landmark.locationCoordinate).frame(height: 300)
            
            CircleImage(image: landmark.image).frame(width: 180, height: 180)
                .offset(y: -100)
                .padding(.bottom, -80)
            
            // Edit the stack initializer to align the views by their leading edges
            VStack (alignment: .leading) {
                
                HStack {
                    Text(landmark.name).font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        
                    // a spacer extends to make its containing view use all of the space of its parent view
                    Spacer()
                    Text(landmark.state)
                        
                }.font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }.padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: ModelData().landmarks[2])
        .environment(modelData)
}
