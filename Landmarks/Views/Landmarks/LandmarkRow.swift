//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/14.
//

import SwiftUI

struct LandmarkRow: View {
    
    // add landmark as a stored property of LandmarkRow
    
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image.resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            /// In SwiftUI blocks, use if statement to conditionally includes views
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.orange)
            }
        }
    }
}

#Preview {
    // renders the group's child views stacked as one preview in the canvas
    Group {
        LandmarkRow(landmark: ModelData().landmarks[1])
        LandmarkRow(landmark: ModelData().landmarks[3])
    }
}
