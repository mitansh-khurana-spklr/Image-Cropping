//
//  BrightnessFilter.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI

struct BrightnessFilter: View {
    
    @Binding var context: CIContext
    @Binding var displayImage: UIImage
    @Binding var inputBrightness: Double
    var beginImage: UIImage
    
    func brightnessFilter(inputImage: UIImage, inputBrighness: Double) -> Void {
        let ciImage = CIImage(image: inputImage)
        let brightness = CIFilter(name: "CIColorControls")!
        brightness.setValue(ciImage, forKey: kCIInputImageKey)
        brightness.setValue(inputBrighness, forKey: kCIInputBrightnessKey)
        let cgimg = context.createCGImage(brightness.outputImage!, from: brightness.outputImage!.extent)
        displayImage = UIImage(cgImage: cgimg!)
    }
     
    var body: some View {
        FilterSlider(value: $inputBrightness, range: (-0.5,0.5), lable: "Brightness", defaultValue: 0, rangeDisplay: (-0.5,0.5))
            .onChange(of: inputBrightness) { newValue in
                brightnessFilter(inputImage: beginImage, inputBrighness: newValue)
            }
            .padding()
    }
}

//struct BrightnessFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        BrightnessFilter()
//    }
//}
