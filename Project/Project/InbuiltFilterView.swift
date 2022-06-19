//
//  InbuiltFilterView.swift
//  Project
//
//  Created by Mitansh Khurana on 18/06/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct InbuiltFilterView: View {
    @State private var currentFilter = CIFilter(name: "CISepiaTone")
    let context = CIContext()
//    @Binding var uiImage : UIImage
    @State var uiImageShow = finalImageCropped
    @State var filterIntensity: Float = 0
    
    
    
    func applyProcessing() {
        currentFilter?.setValue(filterIntensity, forKey: kCIInputIntensityKey)

        guard let outputImage = currentFilter?.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            uiImageShow = UIImage(cgImage: cgimg)
        }
    }
    
    func loadImage() {
        let inputImage = finalImageCropped

        let beginImage = CIImage(image: inputImage)
        currentFilter?.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: uiImageShow)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                
            Spacer()
            
        
            Slider(value: $filterIntensity)
                .onChange(of: filterIntensity) { newValue in
                loadImage()
                }
                .padding()
            
            Spacer()
            
            
                HStack{
                    Button(action: {
                        currentFilter = CIFilter.sepiaTone()
                    }) {
                        Text("Sepia")
                    }
                    
                }
                .padding()
            
            
            Spacer()
            
        }
    }
}

//struct InbuiltFilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        InbuiltFilterView()
//    }
//}
