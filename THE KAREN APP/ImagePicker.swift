//
//  ImagePicker2.swift
//  CloudKitPublicData
//
//  Created by Temesha Holley on 2/2/24.
//

import SwiftUI


struct ImagePicker:
    UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment (\.presentationMode) private
    var presentationMode
    
    class Coordinator: NSObject,
                       UINavigationControllerDelegate {
        var parent: ImagePicker
        init(parent: ImagePicker) {
            self.parent = parent}
        func imagePickerController(_picker:
                                   UIImagePickerController,
                                   didFinishPickingMediaWithInfo info:
                                   [UIImagePickerController.InfoKey : Any]) {
            if let uiImage =
                info[.originalImage] as? UIImage {
                parent.selectedImage =
                uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context:
                              Context) -> UIImagePickerController {
        let picker =
        UIImagePickerController()
        picker.delegate =
        context.coordinator as! any UIImagePickerControllerDelegate & UINavigationControllerDelegate
        return picker
    }
    func updateUIViewController(_ _uiviewController: UIImagePickerController, context: Context) {}
}
    
    
struct ContentView: View {
    @State private var selectedImage:
    UIImage?
    @State private var
    isImagePickerPresented = false
    var body: some View {
        VStack{
            if let myImage = UIImage(named: "exampleImage") {
                
                
                
                
            } else
            {
                Text("No Image Selected")
            }
            Button("Select Image") {
                isImagePickerPresented.toggle()
            }
            .sheet(isPresented:
                    $isImagePickerPresented) {
                ImagePicker(selectedImage:
                                $selectedImage)
            }
            
            
        }
        
        
        
        padding()
    }
    
}
        
        
        
        
        
//        #Preview {
//            ImagePicker( selectedImage: nil )
//            
//        }
//        
//    
