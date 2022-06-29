//
//  ContrastFilter.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI

struct ContrastFilter: View {
    @Binding var context: CIContext
    @Binding var displayImage: UIImage
    @Binding var inputContrast: Double
    var beginImage: UIImage
    
    func contrastFilter(inputImage: UIImage, inputContrast: Double) -> Void {
        let ciImage = CIImage(image: inputImage)
        let contrast = CIFilter(name: "CIColorControls")!
        contrast.setValue(ciImage, forKey: kCIInputImageKey)
        contrast.setValue(inputContrast, forKey: kCIInputContrastKey)
        let cgimg = context.createCGImage(contrast.outputImage!, from: contrast.outputImage!.extent)
        displayImage = UIImage(cgImage: cgimg!)
    }
     
    var body: some View {
        FilterSlider(value: $inputContrast, range: (0,2), lable: "Contrast", defaultValue: 1, rangeDisplay: (0,2))
            .onChange(of: inputContrast) { newValue in
                contrastFilter(inputImage: beginImage, inputContrast: newValue)
            }
            .padding()
    }
}

//struct ContrastFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        ContrastFilter()
//    }
//}
