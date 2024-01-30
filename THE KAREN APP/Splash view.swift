//
//  Splash view.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/30/24.
//

import SwiftUI

struct Splash_View: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        
        
        if isActive == false {
            VStack{
                Image("KAREN")
                    .font(.system(size: 80)).foregroundColor(.blue)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 9)) {
                    self.size = 1.0
                    self.opacity = 1.0
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
