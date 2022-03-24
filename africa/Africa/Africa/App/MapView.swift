//
//  MapView.swift
//  Africa
//
//  Created by Federico Torres on 24/06/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //Map(coordinateRegion: $region)
        
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            //MapPin(coordinate: item.location, tint: .accentColor)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
            
            // Custom Advanced annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: MAP
        .overlay(
            HStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                })
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black.cornerRadius(8).opacity(0.6))
            .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
