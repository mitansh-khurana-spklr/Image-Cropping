//
//  CroppingPage.swift
//  Project
//
//  Created by Mitansh Khurana on 14/06/22.
//





//  OldCroppingPage.swift
//  Project
//
//  Created by Mitansh Khurana on 18/06/22.
//

import Foundation

var firstFullLoad = true


import SwiftUI

var croppedImage = UIImage()
var finalImageCropped = UIImage()
var croppingWidth: CGFloat = 350
var croppingHeight: CGFloat = 350
var aspectRatioListHorizontal: [[CGFloat]] = [[1,1, 0], [5,4, 0], [4,3, 0], [3,2, 0], [16,9, 0], [2,1, 0]]
var aspectRatioListVertical: [[CGFloat]] = [[1,1, 1], [5,4, 1], [4,3, 1], [3,2, 1], [16,9, 1], [2,1, 1]]
//[[], 4/5, 4/3, 3/2, 16/9, 2/1]

struct CroppingPage: View {
    
    @Binding var uiImage: UIImage
    @Binding var isCropped: Bool
    @Binding var imageToShow: UIImage
    
    
    @State var viewState = CGSize.zero
    @State var rotation : Float = 0.0
    @State var rotateState: Float = 0
    @State var aspectRatio: CGFloat = 1
    @State var aspectRatioSize: CGSize = CGSize(width: 1, height: 1)
    @State var portrait: Bool = true
    @State var horizontalOffset = CGFloat(0)
    @State var verticalOffset = CGFloat(0)
    @State var alignment: String = "Horiontal"
    @State var isOriginal = false
    @State var currFlipped = false
    @State var freeformSelected = false
    
    @State var frameWidth : CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
    @State var frameHeight : CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
    
    @State var aspectRatioList: [[CGFloat]] = [[1,1, 0], [5,4, 0], [4,3, 0], [3,2, 0], [16,9, 0], [2,1, 0]]
    
    @EnvironmentObject var rotateHelper: RotateHelper
    
    
    var body: some View {
        
        GeometryReader{ totalGeometry in
            
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.vertical)
                    
                    VStack{                        
                        Group{
                             ZStack {
                                 GeometryReader { geometry in
                                     ZStack {
                                         ZoomableView(uiImage: $uiImage, viewSize: geometry.size, frameWidth: $frameWidth, frameHeight: $frameHeight, rotation: $rotation, aspectRatioSize: $aspectRatioSize, isOriginal: $isOriginal, currFlipped: $currFlipped, aspectRatio: $aspectRatio)
                                         
                                         
                                         Rectangle()
                                             .opacity(0.5)
                                             .foregroundColor(.black)
                                             .allowsHitTesting(false)
                                             .frame(width: geometry.size.width, height: (geometry.size.height - frameHeight)/2, alignment: .top)
                                             .offset(y: -((geometry.size.height - frameHeight)/2 + (frameHeight - (geometry.size.height - frameHeight)/2)/2) )
                                         
                                         
                                         Rectangle()
                                             .opacity(0.5)
                                             .foregroundColor(.black)
                                             .allowsHitTesting(false)
                                             .frame(width: geometry.size.width, height: (geometry.size.height - frameHeight)/2, alignment: .top)
                                             .offset(y: ((geometry.size.height - frameHeight)/2 + (frameHeight - (geometry.size.height - frameHeight)/2)/2) )
                                         
                                         
                                         Rectangle()
                                             .opacity(0.5)
                                             .foregroundColor(.black)
                                             .allowsHitTesting(false)
                                             .frame(width: (geometry.size.width - frameWidth)/2, height: frameHeight)
                                             .offset(x: ((geometry.size.width - frameWidth)/2 + (frameWidth - (geometry.size.width - frameWidth)/2)/2) )
                                         
                                         Rectangle()
                                             .opacity(0.5)
                                             .foregroundColor(.black)
                                             .allowsHitTesting(false)
                                             .frame(width: (geometry.size.width - frameWidth)/2, height: frameHeight)
                                             .offset(x: -((geometry.size.width - frameWidth)/2 + (frameWidth - (geometry.size.width - frameWidth)/2)/2) )
                                         
                                         
                                         ZStack {
                                             Rectangle()
                                                 .opacity(0.01)
                                                 .allowsHitTesting(false)
                                                 .frame(width: frameWidth, height: frameHeight)
                                             .border(.white, width: 2)
                                             
                                             Rectangle()
                                                 .allowsHitTesting(false)
                                                 .opacity(0.01)
                                                 .frame(width: frameWidth, height: frameHeight/3)
                                                 .border(.white, width: 0.75)
                                             
                                             Rectangle()
                                                 .allowsHitTesting(false)
                                                 .opacity(0.01)
                                                 .frame(width: frameWidth/3, height: frameHeight)
                                                 .border(.white, width: 0.75)
                                         }
                                         
                                         
                                         
                                         if freeformSelected {
                                             TopLeadingButtonView(frameWidth: $frameWidth, frameHeight: $frameHeight, geometry: geometry)
                                         }
                                         
                                         if freeformSelected {
                                             TopTrailingButtonView(frameWidth: $frameWidth, frameHeight: $frameHeight, geometry: geometry)
                                         }
                                         
                                         if freeformSelected {
                                             BottomLeadingButtonView(frameWidth: $frameWidth, frameHeight: $frameHeight, geometry: geometry)
                                         }
                                         
                                         if freeformSelected {
                                             BottomTrailingButtonView(frameWidth: $frameWidth, frameHeight: $frameHeight, geometry: geometry)
                                         }
                                     }
                                 }
                             }
                             .navigationBarItems(
                                trailing:
                                    Button(action: {
                                        let CGrotation = CGFloat(rotateHelper.rotateByAngle)
                                        let radians = CGrotation * Double.pi/180
                                        var newImage = UIImage()
                                        isCropped = true
//                                        if currFlipped == true {
//                                            newImage = uiImage.flipHorizontally()!
//                                        }
//                                        else{
//                                            newImage = uiImage
//                                        }
//                                        newImage = newImage.rotate(radians: Float(radians))!
                                        newImage = uiImage.rotate(radians: Float(radians))!
                                        if currFlipped == true {
                                            newImage = newImage.flipHorizontally()!
                                        }
                                        croppedImage = newImage
                                        croppingWidth = frameWidth
                                        croppingHeight = frameHeight

                                        finalImageCropped = ZoomableView.crop(uiImage: croppedImage, width: croppingWidth, height: croppingHeight)
                                        UIImageWriteToSavedPhotosAlbum(finalImageCropped, nil, nil, nil)

                                    }) {
                                        Text("Done")
                                            .foregroundColor(.yellow)
                                    }
                             )
                         }
                        
                        Group{
                            Spacer()
                            Spacer()
                        }
                        
                        AspectRatioAndRotateView(aspectRatio: $aspectRatio, aspectRatioSize: $aspectRatioSize, portrait: $portrait, aspectRatioList: $aspectRatioList, alignment: $alignment, frameWidth: $frameWidth, frameHeight: $frameHeight, verticalOffset: $verticalOffset, horizontalOffset: $horizontalOffset, isOriginal: $isOriginal, uiImage: $uiImage, currFlipped: $currFlipped, freeformSelected: $freeformSelected, totalGeometry: totalGeometry)
                    }
                    .onAppear {
                        if firstFullLoad {
                            firstFullLoad = false
                            isOriginal = true
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
                        }
                        else {
                            aspectRatio = aspectState
                            if aspectRatio >= 1 {
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
                            else {
                                frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                                frameWidth = frameHeight * aspectRatio
                                portrait = true
                                        
                                verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                            
                                horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                    
                                alignment = "Horizontal"
                            }
                        }
                        
                        if uiImage.size.width < uiImage.size.height {
                            aspectRatioList = aspectRatioListVertical
                        }
                        
                        
                    }
                }
        }
        
    }
}

//struct CroppingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        CroppingPage(uiImage: .constant(UIImage(named: "Landscape")!))
//    }
//}
























