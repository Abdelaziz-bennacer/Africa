//
//  MapView.swift
//  Africa
//
//  Created by Abdelaziz Bennacer on 09/05/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    ))
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        // MARK: - BASIC MAP
        //Map(position: $cameraPosition)
        
        // MARK: - MAP WITH ANNOTATIONS
        Map(position: $cameraPosition) {
            ForEach(locations) { item in
                //Marker(item.name, coordinate: item.location)
                //Marker(item.name, image: "log2", coordinate: item.location).tint(.accent).foregroundStyle(.black)
//                Annotation("", coordinate: item.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32, alignment: .center)
//                }
                
                Annotation(item.name, coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }
        }
//        .overlay(
//            HStack(alignment: .center, spacing: 12) {
//                Image("compass")
//                    .resizable()
//                    .scaledToFit()
//                .frame(width: 48, height: 48, alignment: .center)
//                
//                VStack(alignment: .leading, spacing: 3) {
//                    HStack {
//                        Text("Latitude:")
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                            .foregroundStyle(.accent)
//                        Spacer()
//                        Text("\(cameraPosition.region?.center.latitude)")
//                            .font(.footnote)
//                            .foregroundStyle(.white)
//                            .fontWeight(.bold)
//                    }
//                    Divider()
//                    HStack {
//                        Text("Longitude:")
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                            .foregroundStyle(.accent)
//                        Spacer()
//                        Text("\(cameraPosition.region?.center.longitude)")
//                            .font(.footnote)
//                            .foregroundStyle(.white)
//                            .fontWeight(.bold)
//                    }
//                }
//            }
//            .padding(.vertical, 12)
//            .padding(.horizontal, 16)
//            .background(.black)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
//            .opacity(0.6)
//            .padding()
//            , alignment: .top
//        )
    }
}

#Preview {
    MapView()
}
