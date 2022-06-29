//
//  HueFilter.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI

struct HueFilter: View {
    @Binding var context: CIContext
    @Binding var displayImage: UIImage
    @Binding var inputHue: Double
    var beginImage: UIImage
    
    func hueFilter(inputImage: UIImage, inputHue: Double) -> Void {
        let ciImage = CIImage(image: inputImage)
        let hue = CIFilter(name: "CIHueAdjust")!
        hue.setValue(ciImage, forKey: kCIInputImageKey)
        hue.setValue(inputHue * Double.pi/180, forKey: kCIInputAngleKey)
        let cgimg = context.createCGImage(hue.outputImage!, from: hue.outputImage!.extent)
        displayImage = UIImage(cgImage: cgimg!)
    }
     
    var body: some View {
        FilterSlider(value: $inputHue, range: (-180,180), lable: "Hue", defaultValue: 0, rangeDisplay: (-180,180))
            .onChange(of: inputHue) { newValue in
                hueFilter(inputImage: beginImage, inputHue: newValue)
            }
            .padding()
    }
}

//struct HueFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        HueFilter()
//    }
//}
