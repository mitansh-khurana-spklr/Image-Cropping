//
//  AspectRatioAndRotateView.swift
//  Project
//
//  Created by Mitansh Khurana on 21/06/22.
//

import SwiftUI
import Foundation

struct AspectRatioAndRotateView: View {
    
    
    @Binding var aspectRatio: CGFloat
    @Binding var aspectRatioSize: CGSize
    @Binding var portrait: Bool
    @Binding var aspectRatioList: [[CGFloat]]
    @Binding var alignment: String
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    @Binding var verticalOffset: CGFloat
    @Binding var horizontalOffset: CGFloat
    @Binding var isOriginal: Bool
    @Binding var uiImage: UIImage
    @Binding var currFlipped: Bool
    
    var totalGeometry: GeometryProxy
    
    
    @State var prevRot: CGFloat = 0
    @EnvironmentObject var rotateHelper: RotateHelper
    @State var sliderValue: Double = 0
    @State var prevSliderValue: Double = 0
    @State var displayFloat: Float = 0
    
    
    var body: some View {
        VStack{
            
            HStack {
                
                Button(action: {
                    currFlipped = !currFlipped
                }) {
                    Image(systemName: "arrow.left.arrow.right.square")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .padding(.horizontal)
                    

                
                VStack {
                    
//                    floor(rotateHelper.rotateByAngle * 10) / 10.0
                    
                    HStack {
                        Text("\(Int(displayFloat))")
                            .font(.body)
                        .foregroundColor(.white)
                        
                        Image(systemName: "circle")
                            .font(.system(size: 7))
                            .foregroundColor(.white)
                            .offset(x: -2, y: -5)
                    }
                    
//                    Slider(value: $rotateHelper.rotateByAngle, in: 0...360)
//                        .padding(.horizontal)
                    
                    
                    FilterSlider(value: $sliderValue, range: (-45, 45), lable: "", defaultValue: 0, rangeDisplay: (-45, 45), spacing: 1)
                        .onChange(of: sliderValue) { value in
                            let difference = value - prevSliderValue
                            rotateHelper.rotateByAngle += Float(difference)
                            if rotateHelper.rotateByAngle >= 360 {
                                rotateHelper.rotateByAngle -= 360
                            }
                            if rotateHelper.rotateByAngle < 0 {
                                rotateHelper.rotateByAngle += 360
                            }
                            prevSliderValue = value
                            
                            displayFloat = rotateHelper.rotateByAngle
                            displayFloat = floor(displayFloat * 10)/10
                        }
                    /*
                    Slider(value: $sliderValue, in: -45...45)
                        .onChange(of: sliderValue) { value in
                            let difference = value - prevSliderValue
                            rotateHelper.rotateByAngle += Float(difference)
                            if rotateHelper.rotateByAngle >= 360 {
                                rotateHelper.rotateByAngle -= 360
                            }
                            if rotateHelper.rotateByAngle < 0 {
                                rotateHelper.rotateByAngle += 360
                            }
                            prevSliderValue = value
                            
                            displayFloat = rotateHelper.rotateByAngle
                            displayFloat = floor(displayFloat * 10)/10
                        }
                     */
                }
                    
                
                
                
                Button(action: {
                    withAnimation(nil) {
                        if rotateHelper.rotateByAngle > 0 && rotateHelper.rotateByAngle <= 90{
                            rotateHelper.rotateByAngle = 0
                        }
                        else if rotateHelper.rotateByAngle > 90 && rotateHelper.rotateByAngle <= 180 {
                            rotateHelper.rotateByAngle = 90
                        }
                        else if rotateHelper.rotateByAngle > 180 && rotateHelper.rotateByAngle <= 270 {
                            rotateHelper.rotateByAngle = 180
                        }
                        else{
                            rotateHelper.rotateByAngle = 270
                        }
                        
                        sliderValue = 0
                        prevSliderValue = 0
                        displayFloat = rotateHelper.rotateByAngle
                        displayFloat = floor(displayFloat * 10)/10
                        
                        
                        if aspectRatio >= 1 {
//                            alignment = "Vertical"
                            aspectRatio = 1 / aspectRatio
                            let temp = aspectRatioSize.width
                            aspectRatioSize.width = aspectRatioSize.height
                            aspectRatioSize.height = temp
                                    
                                
                            frameHeight = min(totalGeometry.size.width, UIScreen.main.bounds.size.height/2)
//                            frameHeight = totalGeometry.size.width
                            frameWidth = frameHeight * aspectRatio
                            portrait = true
                            
                            verticalOffset = (totalGeometry.size.height - frameHeight)/2
                            horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                            print("H V = \(frameWidth), \(frameHeight)")
                        }
                        else{
//                            alignment = "Horizontal"
                            aspectRatio = 1 / aspectRatio
                            let temp = aspectRatioSize.width
                            aspectRatioSize.width = aspectRatioSize.height
                            aspectRatioSize.height = temp
                            
                            if(aspectRatio == 1){
                                frameWidth =  min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
                            }
                            else{
                                frameWidth = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
                            }
                            frameHeight = frameWidth/aspectRatio
                            portrait = false
                                
                                
                            verticalOffset = (totalGeometry.size.height - frameHeight)/2
                            horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                            print("V H = \(frameWidth), \(frameHeight)")
                            
                        }
                    }
                    
                }) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                        .font(.title)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
                .padding(.horizontal)
                
                /*
                Button(action: {
                    let CGrotation = CGFloat(rotateHelper.rotateByAngle)
                    let radians = CGrotation * Double.pi/180
                    let newImage = uiImage.rotate(radians: Float(radians))
                    croppedImage = newImage!
                    croppingWidth = frameWidth
                    croppingHeight = frameHeight

                    finalImageCropped = ZoomableView.crop(uiImage: croppedImage, width: croppingWidth, height: croppingHeight)
                    
                    imageToShow = finalImageCropped
                    isCropped = true
//                                    isShowingFilterView = true
                }) {
                    Image(systemName: "crop")
                        .foregroundColor(.white)
                        .font(.title)
                }
                 */
            }
            .padding(.vertical)
            
//            OldButtonView(aspectRatio: $aspectRatio, aspectRatioSize: $aspectRatioSize, portrait: $portrait, aspectRatioList: $aspectRatioList, alignment: $alignment, frameWidth: $frameWidth, frameHeight: $frameHeight, verticalOffset: $verticalOffset, horizontalOffset: $horizontalOffset, totalGeometry: totalGeometry)
            
            AspectRatioButtonsView(aspectRatio: $aspectRatio, aspectRatioSize: $aspectRatioSize, portrait: $portrait, aspectRatioList: $aspectRatioList, alignment: $alignment, frameWidth: $frameWidth, frameHeight: $frameHeight, verticalOffset: $verticalOffset, horizontalOffset: $horizontalOffset, isOriginal: $isOriginal, uiImage: $uiImage, displayFloat: $displayFloat, sliderValue: $sliderValue, prevSliderValue: $prevSliderValue, currFlipped: $currFlipped, totalGeometry: totalGeometry)
                .padding(.horizontal)
            
        }
//        .background(Color(red: 30/255, green: 30/255, blue: 30/255, opacity: 1.0))
    }
}

//struct AspectRatioAndRotateView_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectRatioAndRotateView()
//    }
//}
