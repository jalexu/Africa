//
//  MapView.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: -PROPETIES
    @State private var region: MKCoordinateRegion = {
        var mapCoodinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoodinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let location: [LocationModel] = Bundle.main.decode("locations.json")
    
    //MARK: -BODY
    var body: some View {
        //MARK: -Nro1 BASIC MAP
        //Map(coordinateRegion: $region)
        
        //MARK: -Nro2 ADVICE MAP
        Map(coordinateRegion: $region, annotationItems: location, annotationContent: { item in
            // (A) PIN: OLD STYLE(Always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE(Always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTUME BASIC ANOTATION: NEW STYLE(interactive)
//            MapAnnotation(coordinate: item.location){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//: ANNOTATION
            
            // (D) CUSTUME BASIC ANOTATION: NEW STYLE(interactive)
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
            
        })//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 20) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        Text("Latitud: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }//: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding(), alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
