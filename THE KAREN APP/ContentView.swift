//
//  ContentView.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/25/24.
//

import SwiftUI
import MapKit
import UIKit

struct ContentView: View {
    
    
    @State private var userLocationInput = ""
    @State var region =   MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.04585), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var isMapClicked = false
    
    var body: some View {
        
        ZStack {
            Color(.blue)
            //.ignoreSafeArea()
            
            VStack {
                
                ScrollView {
                    
                //    CustomMapView(region: $region)
                    
//                    Image("KAREN")
//                        .scaledToFit()
//                        .padding()
                    
                    //                    Group{
                    //                        ForEach(1...10, id: \.self) { count in
                    //                            ZStack {
                    //                                if 1 == count{
                    //                                    RoundedRectangle(cornerRadius: 8)
                    //                                        .foregroundColor(.blue)
                    //                                } else {
                    //                                    RoundedRectangle(cornerRadius: 8)
                    //                                        .strokeBorder(lineWidth: 2)
                    //                                        .foregroundColor(.accentColor)
                    //                                }
                    //                          
                    //                                }
                    //                                
                    //                                
                    //                                
                    //                                
                    //                                
                    //                            }
                    //                        }
                    
                   
                }
                
                
                
            }
        }
    }
}
    
    


#Preview {
    ContentView()
}
