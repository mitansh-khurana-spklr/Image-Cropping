//
//  SaturationFilter.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI

struct SaturationFilter: View {
    @Binding var context: CIContext
    @Binding var displayImage: UIImage
    @Binding var inputSaturation: Double
    var beginImage: UIImage
    
    func saturationFilter(inputImage: UIImage, inputSaturation: Double) -> Void {
        let ciImage = CIImage(image: inputImage)
        let saturation = CIFilter(name: "CIColorControls")!
        saturation.setValue(ciImage, forKey: kCIInputImageKey)
        saturation.setValue(inputSaturation, forKey: kCIInputSaturationKey)
        let cgimg = context.createCGImage(saturation.outputImage!, from: saturation.outputImage!.extent)
        displayImage = UIImage(cgImage: cgimg!)
    }
     
    var body: some View {
        FilterSlider(value: $inputSaturation, range: (0,2), lable: "Saturation", defaultValue: 1, rangeDisplay: (0,2))
            .onChange(of: inputSaturation) { newValue in
                saturationFilter(inputImage: beginImage, inputSaturation: newValue)
            }
            .padding()
    }
}

//struct SaturationFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        SaturationFilter()
//    }
//}
