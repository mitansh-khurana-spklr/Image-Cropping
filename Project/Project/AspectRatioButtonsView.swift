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
                                    .font(.title2)
                                
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 3))
                                    .offset(y: 2.3)
                            }
                            
                            Text("Original")
                                .foregroundColor(.white)
                                .font(.headline)
                            
                        }
                        .frame(width: 70, height: 70)
                        .overlay(isOriginal ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
                        .cornerRadius(10)
                    }
                    
                    
                    Button(action: {
                        freeformSelected = true
                    }) {
                        VStack {
                            Rectangle()
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 6)
                                .foregroundColor(.white)
                                .opacity(0.5)
                                
                            Text("Free")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .frame(width: 70, height: 70)
                        .overlay(freeformSelected ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
                        .cornerRadius(10)
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
                                        .frame(width: 20, height: 20*aspect[1]/aspect[0])
                                        .opacity(0.5)
                                        .border(.white, width: 2)
                                        .padding(.bottom, 6)
                                        .foregroundColor(.white)
                                        
                                        
                                    if aspect[0] == aspect[1] {
                                        Text("Square")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                    else {
                                        Text("\(Int(aspect[0])) : \(Int(aspect[1]))")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                    
                                }
                                .frame(width: 70, height: 70)
                                .overlay(aspectRatio == aspect[0]/aspect[1] ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
                                .cornerRadius(10)
//                                .background(aspectRatio == aspect[0]/aspect[1] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
                            }
                        }
                        else{
                            Button(action: {
                                if aspect[1]/aspect[0] == aspectRatio {
                                    aspect[2] = CGFloat(0)
                                    aspectRatio = aspect[0]/aspect[1]
                                    aspectRatioSize.width = aspect[0]
                                    aspectRatioSize.height = aspect[1]
                                    
                                    
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
                                        .frame(width: 20*aspect[1]/aspect[0], height: 20)
                                        .opacity(0.5)
                                        .border(.white, width: 2)
                                        .padding(.bottom, 6)
                                        .foregroundColor(.white)

                                    if aspect[0] == aspect[1] {
                                        Text("Square")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                    else {
                                        Text("\(Int(aspect[1])) : \(Int(aspect[0]))")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                     
                                }
                                .frame(width: 70, height: 70)
                                .overlay(aspectRatio == aspect[1]/aspect[0] ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
                                .cornerRadius(10)
//                                .background(aspectRatio == aspect[1]/aspect[0] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
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
