//
//  AdjustPage.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI


var adjustOptions: [String] = ["Brightness", "Contrast", "Saturation", "Exposure", "Hue", "Sharpen", "Noise", "Sepia", "Gamma", "Blur"]

let image = UIImage(named: "photoss")!
//var beginImage = UIImage(named: "photoss")!
var beginImage = finalImageCropped

struct AdjustPage: View {
    
    @State var context = CIContext(options: nil)
    @State var displayImage = UIImage(named: "photoss")!
    @State var placeHolder: Double = 0
    @State var inputBrightness: Double = 0
    @State var inputContrast: Double = 1
    @State var inputSaturation: Double = 1
    @State var inputExposure: Double = 0.5
    @State var inputHue: Double = 0
    @State var filterSelected: String = "none"
    
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Spacer()
                
                Image(uiImage: displayImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 500)
                .padding()
                
                Spacer()
                
                
                if filterSelected == "Brightness" {
                    BrightnessFilter(context: $context, displayImage: $displayImage, inputBrightness: $inputBrightness, beginImage: beginImage)
                }
                else if filterSelected == "Contrast" {
                    ContrastFilter(context: $context, displayImage: $displayImage, inputContrast: $inputContrast, beginImage: beginImage)
                }
                else if filterSelected == "Saturation" {
                    SaturationFilter(context: $context, displayImage: $displayImage, inputSaturation: $inputSaturation, beginImage: beginImage)
                }
                else if filterSelected == "Exposure" {
                    ExposureFilter(context: $context, displayImage: $displayImage, inputExposure: $inputExposure, beginImage: beginImage)
                }
                else if filterSelected == "Hue" {
                    HueFilter(context: $context, displayImage: $displayImage, inputHue: $inputHue, beginImage: beginImage)
                }
                else {
                    FilterSlider(value: $placeHolder, range: (-1,1), lable: "Select Option", defaultValue: 0, rangeDisplay: (-1,1))
                        .padding()
                }
                
                
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (adjustOptions, id: \.self){name in
                            Button(action: {
                                filterSelected = name
//                                beginImage = displayImage
                            }) {
                                VStack {
                                    Image(systemName: returnSymbol(adjustType: name))
                                        .foregroundColor(.white)
                                        .font(.title)
                                        
                                    
                                    Text("\(name)")
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .font(.callout)
                                        .opacity(0.8)
                                }
                                .frame(width: 80, height: 100)
                            }
                            
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct AdjustPage_Previews: PreviewProvider {
    static var previews: some View {
        AdjustPage()
    }
}



func returnSymbol(adjustType: String) -> String {
    
    if adjustType == "Brightness" {
        return "sun.max.fill"
    }
    else if adjustType == "Contrast" {
        return "circle.lefthalf.filled"
    }
    else if adjustType == "Saturation" {
        return "eyedropper.full"
    }
    else if adjustType == "Exposure" {
        return "plusminus.circle.fill"
    }
    else if adjustType == "Hue" {
        return "rotate.3d"
    }
    else if adjustType == "Sharpen" {
        return "triangle.lefthalf.filled"
    }
    else if adjustType == "Noise" {
        return "livephoto"
    }
    else if adjustType == "Sepia" {
        return "drop"
    }
    else if adjustType == "Gamma" {
        return "circle.hexagongrid"
    }
    else if adjustType == "Blur" {
        return "waveform"
    }
    
    return ""
}
