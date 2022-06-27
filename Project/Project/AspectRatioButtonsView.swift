//
//  AspectRatioButtonsView.swift
//  Project
//
//  Created by Mitansh Khurana on 22/06/22.
//

import SwiftUI

struct AspectRatioButtonsView: View {
    
    
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
    @Binding var displayFloat: Float
    @Binding var sliderValue: Double
    @Binding var prevSliderValue: Double
    @Binding var currFlipped: Bool
    @Binding var offset: CGPoint
    @Binding var offsetCheck: CGFloat
    @Binding var freeformSelected: Bool
    
    var totalGeometry: GeometryProxy
    @EnvironmentObject var rotateHelper: RotateHelper
    
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {
                        isOriginal = true
                        rotateHelper.rotateByAngle = 0
                        displayFloat = 0
                        sliderValue = 0
                        prevSliderValue = 0
                        currFlipped = false
                        offset = CGPoint(x: 1317/2, y: 0)
                        offsetCheck = 0
                        prevPrintValue = 0
                        freeformSelected = false
                        
                        let imageAspectRatio = uiImage.size.width/uiImage.size.height
                        aspectRatio = imageAspectRatio
                        aspectState = aspectRatio
                        
                        if(aspectRatio >= 1){
                            frameWidth = UIScreen.main.bounds.size.width
                            frameHeight = frameWidth / imageAspectRatio
                        }
                        else{
                            frameHeight = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
                            frameWidth = frameHeight * aspectRatio
                        }
                    }) {
                        VStack {
                            
                            ZStack {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.white)
                                    .font(.title)
                                
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 4))
                                    .offset(y: 2.5)
                            }
                            
                            Text("Original")
                                .foregroundColor(.white)
                                .font(.footnote)
                            
                        }
                        .frame(width: 70, height: 85)
                        .overlay(isOriginal ? RoundedRectangle(cornerRadius: 0).stroke(Color.blue, lineWidth: 4) : nil)
                        .cornerRadius(0)
                    }
                    
                    
                    Button(action: {
                        freeformSelected = true
                        isOriginal = false
                    }) {
                        VStack {
                            Rectangle()
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                .frame(width: 40, height: 40)
                                .padding(.bottom, 6)
                                .foregroundColor(.white)
                                .opacity(0.5)
                                
                            Text("Free")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                        .frame(width: 70, height: 85)
                        .overlay(freeformSelected ? RoundedRectangle(cornerRadius: 0).stroke(Color.blue, lineWidth: 4) : nil)
                        .cornerRadius(0)
                    }
                    
                    
                    
                    ForEach($aspectRatioList, id:\.self) { $aspect in
                        if aspect[2] == CGFloat(0) {
                            Button(action: {
                                
                                isOriginal = false
                                freeformSelected = false
                                
                                if aspect[0]/aspect[1] == aspectRatio {
                                    aspect[2] = CGFloat(1)
                                    aspectRatio = aspect[1]/aspect[0]
                                    aspectRatioSize.width = aspect[1]
                                    aspectRatioSize.height = aspect[0]
                                    aspectState = aspectRatio
                                                

                                    frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                                    frameWidth = frameHeight * aspectRatio
                                    portrait = true
                                            
                                    verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                                
                                    horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                    
                                }
                                else{
                                    aspectRatio = aspect[0]/aspect[1]
                                    aspectRatioSize.width = aspect[0]
                                    aspectRatioSize.height = aspect[1]
                                    aspectState = aspectRatio
                                    
                                    
                                    if(aspectRatio == 1){
                                        frameWidth =  min(totalGeometry.size.width, totalGeometry.size.height/2)
                                    }
                                    else{
                                        frameWidth = totalGeometry.size.width
                                    }
                                    frameHeight = frameWidth/aspectRatio
                                    portrait = false
                                                
                                    verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                    horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                        
                                    alignment = "Vertical"
                                }
                                
                            }) {
                                VStack {
                                    Rectangle()
                                        .frame(width: 40, height: 40*aspect[1]/aspect[0])
                                        .opacity(0.3)
                                        .border(.white, width: 1)
                                        .padding(.bottom, 6)
                                        .foregroundColor(.white)
                                        
                                        
                                    if aspect[0] == aspect[1] {
                                        Text("Square")
                                            .foregroundColor(.white)
                                            .font(.footnote)
                                    }
                                    else {
                                        Text("\(Int(aspect[0])):\(Int(aspect[1]))")
                                            .foregroundColor(.white)
                                            .font(.footnote)
                                    }
                                    
                                }
                                .frame(width: 70, height: 85)
                                .overlay(aspectRatio == aspect[0]/aspect[1] && !freeformSelected && !isOriginal ? RoundedRectangle(cornerRadius: 0).stroke(Color.blue, lineWidth: 4) : nil)
                                .cornerRadius(0)
                            }
                        }
                        else{
                            Button(action: {
                                if aspect[1]/aspect[0] == aspectRatio {
                                    aspect[2] = CGFloat(0)
                                    aspectRatio = aspect[0]/aspect[1]
                                    aspectRatioSize.width = aspect[0]
                                    aspectRatioSize.height = aspect[1]
                                    aspectState = aspectRatio
                                    
                                    
                                    if(aspectRatio == 1){
                                        frameWidth =  min(totalGeometry.size.width, totalGeometry.size.height/2)
                                    }
                                    else{
                                        frameWidth = totalGeometry.size.width
                                    }
                                    frameHeight = frameWidth/aspectRatio
                                    portrait = false
                                                
                                    verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                    horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                }
                                else{
                                    aspectRatio = aspect[1]/aspect[0]
                                    aspectRatioSize.width = aspect[1]
                                    aspectRatioSize.height = aspect[0]
                                    aspectState = aspectRatio
                                                

                                    frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                                    frameWidth = frameHeight * aspectRatio
                                    portrait = true
                                            
                                    verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                                
                                    horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                        
                                    alignment = "Horizontal"
                                }
                            }) {
                                VStack {
                                    
                                    Rectangle()
                                        .frame(width: 30*aspect[1]/aspect[0], height: 30)
                                        .opacity(0.3)
                                        .border(.white, width: 1)
                                        .padding(.bottom, 6)
                                        .foregroundColor(.white)

                                    if aspect[0] == aspect[1] {
                                        Text("Square")
                                            .foregroundColor(.white)
                                            .font(.footnote)
                                    }
                                    else {
                                        Text("\(Int(aspect[1])):\(Int(aspect[0]))")
                                            .foregroundColor(.white)
                                            .font(.footnote)
                                    }
                                     
                                }
                                .frame(width: 70, height: 85)
                                .overlay(aspectRatio == aspect[1]/aspect[0] && !freeformSelected && !isOriginal ? RoundedRectangle(cornerRadius: 0).stroke(Color.blue, lineWidth: 4) : nil)
                                .cornerRadius(0)
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct AspectRatioButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectRatioButtonsView()
//    }
//}
