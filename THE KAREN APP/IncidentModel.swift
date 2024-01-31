//
//  IncidentModel.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/30/24.
//

import Foundation
struct IncidentModel{
    
    
    var name:String
    var incident:String
    var image: String
    var timestamp:Date
    
    
    
}
func printAndModifyModel() {
    let Model = IncidentModel (name:"Temsha", incident: "Accident", image:
                                "KAREN_image.jpg", timestamp: Date())
    
    print("name: \(Model.name)")
    print("Incident: \(Model.incident)")
    print("image: \(Model.image)")
    print("timestamp: \(Model.timestamp)")
    
    //change name
    var mutableModel = Model
    mutableModel.name = "Jane Doe"
    
    print("Updated Name: \(mutableModel.name)")
    
    printAndModifyModel()
    
    
}
