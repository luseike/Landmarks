//
//  MapView.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/14.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordiante: CLLocationCoordinate2D
    
    var body: some View {
        // Map(initialPosition: .region(regoin))
        Map(position: .constant(.region(regoin)))
    }
    
    private var regoin: MKCoordinateRegion {
        MKCoordinateRegion(center: coordiante, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
}

#Preview {
    MapView(coordiante: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
}
