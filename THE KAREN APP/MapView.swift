//
//  MapView.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/29/24.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    
    @State private var userLocationInput = ""
    
    
    
    @State var region =   MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.04585), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    //    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.04585), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var isMapClicked = false
    
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    Map(coordinateRegion: $region)
                        .frame(height:200)
                    
                    
                }
            }
        }
    }
}
#Preview {
    

    CustomMapView( )
}
