//
//  Splash view.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/30/24.
//

import SwiftUI


struct Splash_View: View {
    @State private var isActive = false
    @State private var size = 0.9   
    
    @State private var opacity = 0.8
    
   
    
    var body: some View {
        
        
        if isActive == false {
            VStack{
                Image("KAREN")
            .font(.system(size: 1000)).foregroundColor(.blue)
            .scaledToFit()
               
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 6)) {
                    self.size = 1.0
                    self.opacity = 35
                    isActive = true
                }
            }
        } else {
            CustomMapView()
        }
        }
    }
    


#Preview {
    Splash_View()
}
