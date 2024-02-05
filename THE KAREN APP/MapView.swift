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
    @State private var sheetDetail: InventoryItem?

    struct InventoryItem: Identifiable {
        var id: String
        let partNumber: String
        let quantity: Int
        let name: String
    }

    
    @State var incidentList:[IncidentModel] = [
        IncidentModel (name:"Gabby", incident: "Fire on Linwood and Clairmount", image:
                        "fire", timestamp: Date()),
        IncidentModel (name:"Johnell", incident: "Hit and run accident on Woodward and Brush", image:
                        "car", timestamp: Date()),
        IncidentModel (name:"Jane Doe", incident: "I caught this fool breaking into my house last night when I got off work", image:
                        "bande", timestamp: Date()),
        IncidentModel (name:"John Doe", incident: "They tried to rob me and my friend yesterday. If you know who they are please inbox me", image:
                        "rob", timestamp: Date()),
        IncidentModel (name:"Robert", incident: "This dog chased me home from school. He is in the area of Broadstreet and Elmhurst", image:
                        "dog", timestamp: Date()),
        IncidentModel (name:"Charlie", incident: "If this is your car, they left it on Heyden and Grandriver", image:
                        "stolen car", timestamp: Date()),
        IncidentModel (name:"Emma", incident: "Gleamers is handing out food bags at Saint Cecila church on Livernois and Sterns", image:
                        "food giveaway", timestamp: Date())
    
    
    
    ]
    
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
            
            VStack{
                
          
                ScrollView{
                    Text("IN CASE OF EMERGENCY CALL 911")
                    Color(.red)
                    Map(coordinateRegion: $region)
                    .frame(height:500)
                    
                    Button {
                        sheetDetail = InventoryItem(
                            id: "0123456789",
                            partNumber: "Z-1234A",
                            quantity: 100,
                            name: "Widget")
                    } label: {
                        Text("START HERE")
                            .foregroundStyle(.white)
                            
                    }
                    .padding(5)
                    .background(.black)
                    .clipShape(Capsule())
                    
                    
                    ForEach(incidentList) { incident in
                   
                        
                        HStack {
                            
                            VStack {
                                
                                Text(incident.name)
                                    .font(.largeTitle)
                                Text(incident.incident)
                                Image(incident.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                            
                            Text("\(incident.timestamp.formatted())")
                            
                        }
                      
                    }

                }
   
            }
            .sheet(item: $sheetDetail) { detail in
                HStack {
                    
                
                    VStack {
                        
                        Text(incident.name)
                            .font(.largeTitle)
                        Text(incident.incident)
                        Image(incident.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                }
                .onTapGesture {
                    sheetDetail = nil
                }
            }
        }
    }
}

#Preview {
    

    CustomMapView( )
}
