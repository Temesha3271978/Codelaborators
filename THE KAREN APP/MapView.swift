//
//  MapView.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/29/24.
//

import SwiftUI
import MapKit
import Foundation

struct CustomMapView: View {
    var incident =  IncidentModel(name:"User1", incident: "Accident", image:
                                    "Image1", timestamp: Date())
    
    @State private var userLocationInput = ""
    
    
    
    @State var region =   MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.04585), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    
    @State private var isMapClicked = false
    
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    Text("IN CASE OF EMERGENCY CALL 911")
                    Color(.red)
                    Map(coordinateRegion: $region)
                    .frame(height:700)
                
                    
                
                    Image("Image1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
Image("Image2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("Image3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                }
        
                 
                    
              
                       
                    
                
            }
        }
    }
}
//IncidentModel()
#Preview {
    

    CustomMapView( )
}
