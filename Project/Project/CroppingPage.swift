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



import SwiftUI

var croppedImage = UIImage()
var finalImageCropped = UIImage()
var croppingWidth: CGFloat = 350
var croppingHeight: CGFloat = 350
var aspectRatioListHorizontal: [[CGFloat]] = [[1,1], [5,4], [4,3], [3,2], [16, 9], [2, 1]]
var aspectRatioListVertical: [[CGFloat]] = [[1,1], [4,5], [3,4], [2,3], [9,16], [1,2]]

//[[], 4/5, 4/3, 3/2, 16/9, 2/1]

struct CroppingPage: View {
    
    @Binding var uiImage: UIImage
    @Binding var isCropped: Bool
    @Binding var imageToShow: UIImage
    
    
    @State var viewState = CGSize.zero
    @State var rotation : Float = 0.0
    @State var rotateState: Float = 0

    @State var frameWidth : CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
    @State var frameHeight : CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)

    @State var aspectRatio: CGFloat = 1
    @State var aspectRatioSize: CGSize = CGSize(width: 1, height: 1)
    @State var portrait: Bool = true
    
    @State var horizontalOffset = CGFloat(0)
    @State var verticalOffset = CGFloat(0)
    
    
    
    @EnvironmentObject var rotateHelper: RotateHelper
    
    @State var alignment: String = "Horiontal"
    @State var aspectRatioList: [[CGFloat]] = [[1,1, 0], [5,4, 0], [4,3, 0], [3,2, 0], [16,9, 0], [2,1, 0]]
    
    @State var isOriginal = false
    @State var currFlipped = false
    @State var freeformSelected = false
    
//    @State var isShowingFilterView = false
    
//    @State var rotatedBoxWidth: CGFloat
//    @State var rotatedBoxHeight: CGFloat
    
    
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
                                             .border(.white, width: 3)
                                             
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
                                             Image(systemName: "arrow.up.left.and.arrow.down.right")
                                                 .font(.system(size: 20))
                                                 .background(Circle().frame(width: 30, height: 30).foregroundColor(.white))
                                                 .frame(width: frameWidth, height: frameHeight, alignment: .topLeading)
                                                 .foregroundColor(.black)
                                                 .offset(x: -5, y: -5)
                                                 .gesture(DragGesture()
                                                    .onChanged{drag in
                                                        var tempFrameWidth = frameWidth
                                                        var tempFrameHeight = frameHeight
                                                        tempFrameWidth -= drag.translation.width
                                                        tempFrameHeight -= drag.translation.height
                                                        
                                                        if tempFrameWidth < 60 {
                                                            tempFrameWidth = 60
                                                        }
                                                        if tempFrameHeight < 60 {
                                                            tempFrameHeight = 60
                                                        }
                                                        if tempFrameWidth > geometry.size.width {
                                                            tempFrameWidth = geometry.size.width
                                                        }
                                                        if tempFrameHeight > geometry.size.height {
                                                            tempFrameHeight = geometry.size.height
                                                        }
                                                        
                                                        frameWidth = tempFrameWidth
                                                        frameHeight = tempFrameHeight
                                                        
                                                        
                                                    })
                                         }
                                     }
                                     
                                 }
                                 
                                 
                                 /*
                                 ZStack {
                                     Rectangle()
                                         .opacity(0.01)
                                         .allowsHitTesting(false)
                                         .frame(width: frameWidth, height: frameHeight)
                                     .border(.white, width: 3)
                                     
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
                                  */
                                 
                                 /*
                                 if freeformSelected {
                                     Image(systemName: "arrow.up.left.and.arrow.down.right")
                                         .font(.system(size: 20))
                                         .background(Circle().frame(width: 30, height: 30).foregroundColor(.white))
                                         .frame(width: frameWidth, height: frameHeight, alignment: .topLeading)
                                         .foregroundColor(.black)
                                         .offset(x: -5, y: -5)
                                         .gesture(DragGesture()
                                            .onChanged{drag in
                                                frameWidth -= drag.translation.width
                                                frameHeight -= drag.translation.height
                                                
        
                                            })
                                 }
                                  */

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
                }
        }
        
    }
}

//struct CroppingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        CroppingPage(uiImage: .constant(UIImage(named: "Landscape")!))
//    }
//}
























