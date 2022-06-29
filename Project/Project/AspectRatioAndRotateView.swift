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
    @Binding var freeformSelected: Bool
    
    var totalGeometry: GeometryProxy
    
    
    @State var prevRot: CGFloat = 0
    @EnvironmentObject var rotateHelper: RotateHelper
    @State var sliderValue: Double = 0
    @State var prevSliderValue: Double = 0
    @State var displayFloat: Float = 0
    @State var offsetCheck: CGFloat = 0
    @State var rotateOrReset: Bool = false
    @State var offset: CGPoint = CGPoint(x: 1297/2, y: 0)
    
    
    var body: some View {
        VStack{
            
            HStack {
                
                Button(action: {
                    currFlipped = !currFlipped
                    flipState = currFlipped
                    isFlipPressed = true
                }) {
                    Image(systemName: "arrow.left.arrow.right.square")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .padding(.trailing)
                .offset(y: -2)
                    

                
                VStack {
                    SliderSetup(offsetCheck: $offsetCheck, offset: $offset)
                        .onChange(of: offsetCheck) { newValue in
                            let difference = ((newValue*45)/(1297/2)) - prevPrintValue
                            rotateHelper.rotateByAngle += Float(difference)
                            if rotateHelper.rotateByAngle >= 360 {
                                rotateHelper.rotateByAngle -= 360
                            }
                            if rotateHelper.rotateByAngle < 0 {
                                rotateHelper.rotateByAngle += 360
                            }
                            prevPrintValue = ((newValue*45)/(1297/2))
                    }
//                        .padding(.horizontal)
                    
                }
                    
                
                
                
                Button(action: {
                    withAnimation(nil) {
                        
                        isRotated90 = true
                        
                        if rotateHelper.rotateByAngle > 0 && rotateHelper.rotateByAngle <= 90{
                            rotateHelper.rotateByAngle = 0
                            rotateTo = 0
                        }
                        else if rotateHelper.rotateByAngle > 90 && rotateHelper.rotateByAngle <= 180 {
                            rotateHelper.rotateByAngle = 90
                            rotateTo = 90
                        }
                        else if rotateHelper.rotateByAngle > 180 && rotateHelper.rotateByAngle <= 270 {
                            rotateHelper.rotateByAngle = 180
                            rotateTo = 180
                        }
                        else{
                            rotateHelper.rotateByAngle = 270
                            rotateTo = 270
                        }
                        
                        sliderValue = 0
                        prevSliderValue = 0
                        displayFloat = rotateHelper.rotateByAngle
                        displayFloat = floor(displayFloat * 10)/10
                        offset = CGPoint(x: 1297/2, y: 0)
                        offsetCheck = 0
                        prevPrintValue = 0
                        
                        
                        if aspectRatio >= 1 {
//                            alignment = "Vertical"
                            aspectRatio = 1 / aspectRatio
                            let temp = aspectRatioSize.width
                            aspectRatioSize.width = aspectRatioSize.height
                            aspectRatioSize.height = temp
                            aspectState = aspectRatio
                                    
                                
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
                            aspectState = aspectRatio
                            
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
                .padding(.leading)
                .offset(y: -2)
            }
            .padding(.vertical)
            
            AspectRatioButtonsView(aspectRatio: $aspectRatio, aspectRatioSize: $aspectRatioSize, portrait: $portrait, aspectRatioList: $aspectRatioList, alignment: $alignment, frameWidth: $frameWidth, frameHeight: $frameHeight, verticalOffset: $verticalOffset, horizontalOffset: $horizontalOffset, isOriginal: $isOriginal, uiImage: $uiImage, displayFloat: $displayFloat, sliderValue: $sliderValue, prevSliderValue: $prevSliderValue, currFlipped: $currFlipped, offset: $offset, offsetCheck: $offsetCheck, freeformSelected: $freeformSelected, totalGeometry: totalGeometry)
                .padding(.horizontal)
            
        }
    }
}

//struct AspectRatioAndRotateView_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectRatioAndRotateView()
//    }
//}
