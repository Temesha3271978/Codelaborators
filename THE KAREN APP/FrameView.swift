//
//  FrameView.swift
//  Live Feed
//
//  Created by Chantelle Salter on 2/2/24.
//

import SwiftUI

struct FrameView: View {
    var image: CGImage?
    private let label = Text("frame")
    
    var body: some View {
        
        VStack {
            Text("Camera Below")
            if let image = image {
                Image(image, scale: 1.0, orientation: .up, label: label)
            } else {
                Color.black
                
            }
        }
        
    }
}

#Preview {
    FrameView()
}
