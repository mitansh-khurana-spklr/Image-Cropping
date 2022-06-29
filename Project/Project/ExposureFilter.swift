//
//  ExposureFilter.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI

struct ExposureFilter: View {
    @Binding var context: CIContext
    @Binding var displayImage: UIImage
    @Binding var inputExposure: Double
    var beginImage: UIImage
    
    func exposureFilter(inputImage: UIImage, inputExposure: Double) -> Void {
        let ciImage = CIImage(image: inputImage)
        let exposure = CIFilter(name: "CIExposureAdjust")!
        exposure.setValue(ciImage, forKey: kCIInputImageKey)
        exposure.setValue(inputExposure, forKey: kCIInputEVKey)
        let cgimg = context.createCGImage(exposure.outputImage!, from: exposure.outputImage!.extent)
        displayImage = UIImage(cgImage: cgimg!)
    }
     
    var body: some View {
        FilterSlider(value: $inputExposure, range: (0,1), lable: "Exposure", defaultValue: 0.5, rangeDisplay: (0,1))
            .onChange(of: inputExposure) { newValue in
                exposureFilter(inputImage: beginImage, inputExposure: newValue)
            }
            .padding()
    }

}

//struct ExposureFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        ExposureFilter()
//    }
//}
