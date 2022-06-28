//
//  Commented.swift
//  Project
//
//  Created by Mitansh Khurana on 14/06/22.
//

import Foundation


//HStack{
//
//                        Spacer()
//
//                        Button(action: {
//                            withAnimation(.default){
//                                aspectRatio = 4/5
//                                frameWidth = 350
//                                frameHeight = frameWidth / aspectRatio
//                            }
//
//                        }) {
//
//                            Text("4:5")
//                                .foregroundColor(.white)
//                                .fontWeight(.semibold)
//                                .font(.title2)
//                                .frame(minWidth: 0, maxWidth: 90, minHeight: 0, maxHeight: 60)
//                                .background(Color(red: 0.105, green: 0.105, blue: 0.105, opacity: 1.0))
//                                .cornerRadius(10)
//
//                        }
//                        .padding()
//
//
//                        Spacer()
//
//
//                        Button(action: {
//                            withAnimation(.default){
//                                aspectRatio = 1
//                                frameWidth = 350
//                                frameHeight = frameWidth / aspectRatio
//                            }
//
//                        }) {
//                            Text("1:1")
//                                .font(.title2)
//                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
//                                .frame(minWidth: 0, maxWidth: 90, minHeight: 0, maxHeight: 60)
//                                .background(Color(red: 0.105, green: 0.105, blue: 0.105, opacity: 1.0))
//                                .cornerRadius(10)
//
//                        }
//
//                        Spacer()
//
//                        Button(action: {
//                            withAnimation(.default){
//                                frameWidth = 350
//                                frameHeight = 350/1.91
//                            }
//
//                        }) {
//                            Text("1.91:1")
//                                .foregroundColor(.white)
//                                .fontWeight(.semibold)
//                                .font(.title2)
//                                .frame(minWidth: 0, maxWidth: 90, minHeight: 0, maxHeight: 60)
//                                .background(Color(red: 0.105, green: 0.105, blue: 0.105, opacity: 1.0))
//                                .cornerRadius(10)
//                        }
//                        .padding()
//
//
//                        Spacer()
//                    }
//



/*
let topConstraint1 = imageView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: verticalOffset)
topConstraint1.identifier = Constraint.top.rawValue
topConstraint1.isActive = true

let leadingConstraint1 = imageView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: horizontalOffset)
leadingConstraint1.identifier = Constraint.leading.rawValue
leadingConstraint1.isActive = true
        

let bottomConstraint = imageView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -verticalOffset)
bottomConstraint.identifier = Constraint.bottom.rawValue
bottomConstraint.isActive = true

let trailingConstraint = imageView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -horizontalOffset)
trailingConstraint.identifier = Constraint.trailing.rawValue
trailingConstraint.isActive = true
 */


/*
let topConstraint = imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: verticalOffset)
topConstraint.identifier = Constraint.top.rawValue
topConstraint.isActive = true

let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: horizontalOffset)
leadingConstraint.identifier = Constraint.leading.rawValue
leadingConstraint.isActive = true

let bottomConstraint = imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -verticalOffset)
bottomConstraint.identifier = Constraint.bottom.rawValue
bottomConstraint.isActive = true


let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -horizontalOffset)
trailingConstraint.identifier = Constraint.trailing.rawValue
trailingConstraint.isActive = true
 */


//        let imageView1 = UIImageView()
//        imageView1.image = uiImage.withAlignmentRectInsets(UIEdgeInsets(top: -verticalOffset, left: -horizontalOffset, bottom: -verticalOffset/2, right: -horizontalOffset/2))


//        let imageView = UIImageView()
//        imageView.image = uiImage.withAlignmentRectInsets(UIEdgeInsets(top: -verticalOffset, left: -horizontalOffset, bottom: -verticalOffset/2, right: -horizontalOffset/2))



//    @Binding var horizontalOffset: CGFloat
//    @Binding var verticalOffset: CGFloat
//    var croppedImage: UIImage
    
//    var imageView : UIImageView






/*
dummyContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
dummyContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
dummyContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
dummyContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true

let topConstraint1 = imageView1.topAnchor.constraint(equalTo: dummyContainer.topAnchor)
topConstraint1.identifier = Constraint.top.rawValue
topConstraint1.isActive = true

let leadingConstraint1 = imageView1.leadingAnchor.constraint(equalTo: dummyContainer.leadingAnchor)
leadingConstraint1.identifier = Constraint.leading.rawValue
leadingConstraint1.isActive = true


let bottomConstraint = imageView1.bottomAnchor.constraint(equalTo: dummyContainer.bottomAnchor)
bottomConstraint.identifier = Constraint.bottom.rawValue
bottomConstraint.isActive = true

let trailingConstraint = imageView1.trailingAnchor.constraint(equalTo: dummyContainer.trailingAnchor)
trailingConstraint.identifier = Constraint.trailing.rawValue
trailingConstraint.isActive = true
 */



/*
dummyContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
dummyContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
dummyContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
dummyContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true



let topConstraint = imageView.topAnchor.constraint(equalTo: dummyContainer.topAnchor)
topConstraint.identifier = Constraint.top.rawValue
topConstraint.isActive = true

let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: dummyContainer.leadingAnchor)
leadingConstraint.identifier = Constraint.leading.rawValue
leadingConstraint.isActive = true

let bottomConstraint = imageView.bottomAnchor.constraint(equalTo: dummyContainer.bottomAnchor)
bottomConstraint.identifier = Constraint.bottom.rawValue
bottomConstraint.isActive = true


let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: dummyContainer.trailingAnchor)
trailingConstraint.identifier = Constraint.trailing.rawValue
trailingConstraint.isActive = true
 */


//        func scrollViewDidZoom(_ scrollView: UIScrollView) {
//            let zoomScale = scrollView.zoomScale
//            print("zoomScale = \(zoomScale)")
//            print("xoffset = \(scrollView.contentOffset.x)")
//            print("yoffset = \(scrollView.contentOffset.y)")
//
//            guard
//                let topConstraint = topConstraint,
//                let leadingConstraint = leadingConstraint,
//                let trailingConstraint = trailingConstraint,
//                let bottomConstraint = bottomConstraint,
//                let imageSize = imageSize,
//                let viewSize = viewSize
//            else {
//                return
//            }
//            topConstraint.constant = max((viewSize.height - (imageSize.height * zoomScale)) / 2.0, 0.0)
//            leadingConstraint.constant = max((viewSize.width - (imageSize.width * zoomScale)) / 2.0, 0.0)
//            bottomConstraint.constant = verticalOffset!
//            trailingConstraint.constant = horizontalOffset!
//        }





//        let widthScale = frameWidth / fittingRect.width
//        let heightScale = frameHeight / fittingRect.height
//        if rotateHelper.rotateByAngle != 90 && rotateHelper.rotateByAngle != 180 && rotateHelper.rotateByAngle != 270 && rotateHelper.rotateByAngle != 0 {
//            return max(widthScale, heightScale) * 3
//        }








//                        HStack{
//                            Button(action: {}) {
//                                Image(systemName: "pencil.slash")
//                                    .foregroundColor(.white)
//                                    .font(.title)
//
//                            }
//                            .padding(.leading)
//
//                            Spacer()
//
//                            Text("Crop Image")
//                                .foregroundColor(.white)
//                                .font(.title3)
//
//                            Spacer()
//
//
//
//                            Button(action: {
//                                let CGrotation = CGFloat(rotateHelper.rotateByAngle)
//                                let radians = CGrotation * Double.pi/180
//                                let newImage = uiImage.rotate(radians: Float(radians))
//                                croppedImage = newImage!
//                                croppingWidth = frameWidth
//                                croppingHeight = frameHeight
//
//                                finalImageCropped = ZoomableView.crop(uiImage: croppedImage, width: croppingWidth, height: croppingHeight)
//                                UIImageWriteToSavedPhotosAlbum(finalImageCropped, nil, nil, nil)
//
//                            }) {
//                                Text("Next")
//                                    .foregroundColor(.blue)
//                                    .fontWeight(.semibold)
//                                    .font(.title3)
//                            }
//                        }
//                        .padding(.trailing)
//                        .navigationBarTitleDisplayMode(.inline)
//                        .toolbar {
//                            ToolbarItem(placement: .principal) {
//                                HStack {
//                                        Text("Crop Image")
//                                            .font(.headline)
//                                            .foregroundColor(.white)
//
//                                        }
//                                    }
//
//                                }
                        
                
//                        Spacer()
//                        Spacer()
//                        Spacer()
//                        Spacer()







//                             .gesture(RotationGesture().onChanged{angle in
//                                 rotation += Float(angle.degrees)
//                             })
//                             .rotationEffect(.degrees(rotation))
//                             .frame(width: frameWidth, height: frameHeight)
//                             .border(.white)




















/*
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
    
    @State var viewState = CGSize.zero
    
    @State var rotation : Float = 0.0
    
    
    
    @State var frameWidth : CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
    @State var frameHeight : CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height/2)
    @State var aspectRatio: CGFloat = 1
    @State var portrait: Bool = true
    
    @State var horizontalOffset = CGFloat(0)
    @State var verticalOffset = CGFloat(0)
    
    
    @EnvironmentObject var rotateHelper: RotateHelper
    
    @State var alignment: String = "Horiontal"
    @State var aspectRatioList: [[CGFloat]] = [[1,1], [5,4], [4,3], [3,2], [16, 9], [2, 1]]
    @State private var rotateState: Double = 0
    @State private var prevRot : Double = 0;
   // @State var setStart = true
    
    var body: some View {
        
        GeometryReader{ totalGeometry in
            
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.vertical)
                    
                    VStack{

                        
                        Group{
                             ZStack {
                                 GeometryReader { geometry in
                                     ZoomableView(uiImage: $uiImage, viewSize: geometry.size, frameWidth: $frameWidth, frameHeight: $frameHeight, rotation: $rotation)
//                                         .rotationEffect(Angle(degrees: self.rotateState))
//                                         .gesture(RotationGesture()
//                                                         .onChanged { value in
//                                             //if setStart{
//                                             let currRot = value.degrees
//                                             let diff = currRot - prevRot
//                                             self.rotateState += diff
//                                             prevRot = currRot
//                                                // setStart = false
//                                            // }
//
//                                                         }
//                                                    .onEnded({ endValue in
//                                            // self.rotateState += endValue.degrees-startRot
//                                           //  setStart = true
//                                             prevRot = 0
//                                         })
//                                                     )
                                 }
    //                             .gesture(RotationGesture().onChanged{angle in
    //                                 rotation += Float(angle.degrees)
    //                             })
    //                             .rotationEffect(.degrees(rotation))
    //                             .frame(width: frameWidth, height: frameHeight)
    //                             .border(.white)
                                 
                                 
                                 
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
                                 
    //                             Image(systemName: "arrow.up.left.and.arrow.down.right")
    //                                 .font(.system(size: 20))
    //                                 .background(Circle().frame(width: 25, height: 25).foregroundColor(.white))
    //                                 .frame(width: frameWidth, height: frameHeight, alignment: .topLeading)
    //                                 .foregroundColor(.black)
    //                                 .offset(x: -5, y: -5)
    //                                 .gesture(DragGesture()
    //                                    .onChanged{drag in
    //                                        frameWidth -= drag.translation.width
    //                                        frameHeight -= drag.translation.height
    //
    //                                    })
                             }
                             .navigationBarItems(
                                trailing:
                                    Button(action: {
                                        let CGrotation = CGFloat(rotateHelper.rotateByAngle)
                                        let radians = rotateState * Double.pi/180
                                        let newImage = uiImage.rotate(radians: Float(radians))
                                        croppedImage = newImage!
                                        croppingWidth = frameWidth
                                        croppingHeight = frameHeight

                                        finalImageCropped = ZoomableView.crop(uiImage: croppedImage, width: croppingWidth, height: croppingHeight)
                                        UIImageWriteToSavedPhotosAlbum(finalImageCropped, nil, nil, nil)

                                    }) {
                                        Text("Next")
                                            .foregroundColor(.blue)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                    }
                             )
                            
                            Slider(value: $rotateHelper.rotateByAngle, in: 0...360)
                            
                         }
                        
                        
                        
                        
                        Spacer()
                        Spacer()
                        
                        
                        VStack{
                            
                            HStack {
                                /*
                                Button(action: {
                                
                                    withAnimation(.default){
                                        if aspectRatio > 1 {
                                            aspectRatio = 1 / aspectRatio
                                            frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                                            frameWidth = frameHeight * aspectRatio
                                            
                                            verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                            
                                            horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                            
                                        }
                                        portrait = true
                                    }
                                    
                                }) {
                                    Image(systemName: "rectangle.portrait")
                                }
                                .foregroundColor(portrait ? .yellow: .white)
                                .font(.title)
                                
                                Button(action: {
                                    
                                    withAnimation(.default) {
                                        if aspectRatio < 1{
                                            aspectRatio = 1 / aspectRatio
                                            frameWidth = totalGeometry.size.width
                                            frameHeight = frameWidth/aspectRatio
                                            
                                            verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                            
                                            horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                            
                                        }
                                        portrait = false
                                    }
                                    
                                }) {
                                    Image(systemName: "rectangle")
                                }
                                .foregroundColor(portrait ? .white: .yellow)
                                .font(.title)
                                
                                */
                                
                                Button(action: {
                                    withAnimation(.default) {
                                        if rotateHelper.rotateByAngle < 90{
                                            rotateHelper.rotateByAngle = 90
                                        }
                                        else if rotateHelper.rotateByAngle < 180 {
                                            rotateHelper.rotateByAngle = 180
                                        }
                                        else if rotateHelper.rotateByAngle < 270 {
                                            rotateHelper.rotateByAngle = 270
                                        }
                                        else{
                                            rotateHelper.rotateByAngle = 0
                                        }
                                    }
                                    
                                }) {
                                    Image(systemName: "rotate.right")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .offset(y: -5)
                                }
                            }
                            .padding(.bottom)
        //
                            
                            
                            
                            HStack {
                                
                                if(alignment == "Horizontal"){
                                    Button(action: {
                                        alignment = "Vertical"
                                        aspectRatioList = aspectRatioListVertical
                                    }) {
                                        VStack {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 30, height: 20)
                                                    .opacity(0.6)
                                                    .border(.white, width: 2)
                                                    .padding(.bottom, 6)
                                                .foregroundColor(.white)
                                            }
                                                
//                                            Spacer()
                                            
                                            Text("Horizontal")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .font(.title3)
                                        }
                                        .frame(width: 110, height: 100)
                                        .background(Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0))
                                        .cornerRadius(10)
                                    }
                                }
                                else{
                                    Button(action: {
                                        alignment = "Horizontal"
                                        aspectRatioList = aspectRatioListHorizontal
                                    }) {
                                        VStack {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 20, height: 30)
                                                    .opacity(0.6)
                                                    .border(.white, width: 2)
                                                    .padding(.bottom, 6)
                                                .foregroundColor(.white)
                                            }
                                                
//                                            Spacer()
                                            
                                            Text("Vertical")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .font(.title3)
                                        }
                                        .frame(width: 110, height: 100)
                                        .background(Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0))
                                        .cornerRadius(10)
                                    }
                                }
                                
                                ScrollView(.horizontal){
                                    HStack{
                                        if(alignment == "Horizontal"){
                                            ForEach(aspectRatioListHorizontal, id:\.self){aspect in
                                                    
                                                Button(action: {
                                                        
                                                withAnimation(.default){
                                                        aspectRatio = aspect[0]/aspect[1]
                                                            
                                                        
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
                                                        
                                                }) {
                                                    VStack {
                                                        
                                                        ZStack {
                                                            Rectangle()
                                                                .frame(width: 30, height: 30*aspect[1]/aspect[0])
                                                                .opacity(0.6)
                                                                .border(.white, width: 2)
                                                                .padding(.bottom, 6)
                                                            .foregroundColor(.white)
                                                        }
                                                            
            //                                            Spacer()
                                                        
                                                        Text("\(Int(aspect[0])) : \(Int(aspect[1]))")
                                                            .foregroundColor(.white)
                                                            .fontWeight(.semibold)
                                                            .font(.title3)
                                                    }
                                                    .frame(width: 110, height: 100)
                                                    .background(Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0))
                                                    .cornerRadius(10)
                                                }
                //                                    .padding()
                                            }
                                        }
                                        else{
                                            ForEach(aspectRatioListVertical, id:\.self){aspect in
                                                    
                                                Button(action: {
                                                        
                                                withAnimation(.default){
                                                        aspectRatio = aspect[0]/aspect[1]
        
                                                        frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                                                            frameWidth = frameHeight * aspectRatio
                                                        portrait = true
                                                        
                                                        verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                                            
                                                        horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                                        }
                                                        
                                                }) {
                                                    VStack {
                                                        
                                                        ZStack {
                                                            Rectangle()
                                                                .frame(width: 30*aspect[0]/aspect[1], height: 30)
                                                                .opacity(0.6)
                                                                .border(.white, width: 2)
                                                                .padding(.bottom, 6)
                                                            .foregroundColor(.white)
                                                        }
                                                            
            //                                            Spacer()
                                                        
                                                        Text("\(Int(aspect[0])) : \(Int(aspect[1]))")
                                                            .foregroundColor(.white)
                                                            .fontWeight(.semibold)
                                                            .font(.title3)
                                                    }
                                                    .frame(width: 110, height: 100)
                                                    .background(Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0))
                                                    .cornerRadius(10)
                                                }
                //                                    .padding()
                                            }
                                        }
                                        
                                    }
                                    .frame(minWidth: UIScreen.main.bounds.size.width)
                                    .padding(.horizontal)
                                }
                            }
                            .padding([.vertical, .horizontal])
                            .background(Color(red: 30/255, green: 30/255, blue: 30/255, opacity: 1.0))
                            .frame(height: 150)
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

*/








/*
Button(action: {

    withAnimation(.default){
        if aspectRatio > 1 {
            aspectRatio = 1 / aspectRatio
            frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
            frameWidth = frameHeight * aspectRatio
            
            verticalOffset = (totalGeometry.size.height - frameHeight)/2
            
            horizontalOffset = (totalGeometry.size.width - frameWidth)/2
            
        }
        portrait = true
    }
    
}) {
    Image(systemName: "rectangle.portrait")
}
.foregroundColor(portrait ? .yellow: .white)
.font(.title)

Button(action: {
    
    withAnimation(.default) {
        if aspectRatio < 1{
            aspectRatio = 1 / aspectRatio
            frameWidth = totalGeometry.size.width
            frameHeight = frameWidth/aspectRatio
            
            verticalOffset = (totalGeometry.size.height - frameHeight)/2
            
            horizontalOffset = (totalGeometry.size.width - frameWidth)/2
            
        }
        portrait = false
    }
    
}) {
    Image(systemName: "rectangle")
}
.foregroundColor(portrait ? .white: .yellow)
.font(.title)

*/









//                                 .gesture(RotationGesture().onChanged { value in
//                                    let currRot = value.degrees
//                                    let diff = currRot - prevRot
//                                    rotateHelper.rotateByAngle += Float(diff)
//                                     if rotateHelper.rotateByAngle >= 360{
//                                         rotateHelper.rotateByAngle -= 360
//                                     }
//                                     if(rotateHelper.rotateByAngle < 0){
//                                         rotateHelper.rotateByAngle += 360
//                                     }
//                                    prevRot = currRot
//                                 }.onEnded({ value in
//                                     prevRot = 0
//                                 }))
                                 
                                 
                                 
                                 
//                                 .rotationEffect(Angle(degrees: Double(self.rotateState)))
//                                 .gesture(RotationGesture().onChanged { value in
//                                        //if setStart{
//                                        let currRot = value.degrees
//                                        let diff = currRot - prevRot
//                                     self.rotateState += Float(diff)
//                                        prevRot = currRot
//                                     rotateHelper.rotateByAngle += Float(diff)
//                                        // setStart = false
//                                        // }
//                                        }.onEnded({ endValue in
//                                        prevRot = 0
//                                                                          })
//                                                                                      )
                                 













/*
Button(action: {
    
withAnimation(.default){
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
    
}) {
VStack {
    
    
    Rectangle()
        .frame(width: 20, height: 20*aspect[1]/aspect[0])
        .opacity(0.6)
        .border(.white, width: 2)
        .padding(.bottom, 6)
        .foregroundColor(.white)
    
    
    
    Text("\(Int(aspect[0])) : \(Int(aspect[1]))")
        .foregroundColor(.white)
        .font(.headline)
}
.frame(width: 70, height: 70)
.background(aspectRatio == aspect[0]/aspect[1] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
.cornerRadius(10)
//                                                    .padding(.horizontal)
//                                                    .overlay(aspectRatio == aspect[0]/aspect[1] ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
}
*/







/*
else{
    ForEach(aspectRatioListVertical, id:\.self){aspect in
            
        Button(action: {
                
        withAnimation(.default){
                aspectRatio = aspect[0]/aspect[1]
            aspectRatioSize.width = aspect[0]
            aspectRatioSize.height = aspect[1]
                    

                frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                    frameWidth = frameHeight * aspectRatio
                portrait = true
                
                verticalOffset = (totalGeometry.size.height - frameHeight)/2
                    
                horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                }
                
        }) {
            VStack {
                
                
                Rectangle()
                    .frame(width: 20*aspect[0]/aspect[1], height: 20)
                    .opacity(0.6)
                    .border(.white, width: 2)
                    .padding(.bottom, 6)
                    .foregroundColor(.white)

                    
                
                Text("\(Int(aspect[0])) : \(Int(aspect[1]))")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(width: 70, height: 70)
            .background(aspectRatio == aspect[0]/aspect[1] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
            .cornerRadius(10)
//                                                    .padding(.horizontal)
//                                                    .overlay(aspectRatio == aspect[0]/aspect[1] ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
        
        }
    }
}
*/






/*
if(alignment == "Horizontal"){
    Button(action: {
        alignment = "Vertical"
        aspectRatioList = aspectRatioListVertical
    }) {
        Image(systemName: "rectangle")
            .foregroundColor(.white)
                .font(.title)
    }
    .padding(.horizontal)
}
else{
    Button(action: {
        alignment = "Horizontal"
        aspectRatioList = aspectRatioListHorizontal
    }) {
        VStack {
            
            Image(systemName: "rectangle.portrait")
                .foregroundColor(.white)
                .font(.title)
        }
    }
    .padding(.horizontal)
}
*/








//                Text ("\(Int((printValue*45)/(1184/2)))")









//                    floor(rotateHelper.rotateByAngle * 10) / 10.0
                    
                    /*
                    HStack {
                        Text("\(Int(displayFloat))")
                            .font(.body)
                        .foregroundColor(.white)
                        
                        Image(systemName: "circle")
                            .font(.system(size: 7))
                            .foregroundColor(.white)
                            .offset(x: -2, y: -5)
                    }
                     */
                     
                    
//                    Slider(value: $rotateHelper.rotateByAngle, in: 0...360)
//                        .padding(.horizontal)
                    
                    /*
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
                        }*/
                     
                    
                    
                    









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










//            OldButtonView(aspectRatio: $aspectRatio, aspectRatioSize: $aspectRatioSize, portrait: $portrait, aspectRatioList: $aspectRatioList, alignment: $alignment, frameWidth: $frameWidth, frameHeight: $frameHeight, verticalOffset: $verticalOffset, horizontalOffset: $horizontalOffset, totalGeometry: totalGeometry)









//        .background(Color(red: 30/255, green: 30/255, blue: 30/255, opacity: 1.0))





//                                .background(aspectRatio == aspect[0]/aspect[1] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)





//                                .background(aspectRatio == aspect[1]/aspect[0] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)








//        let imageView = UIImageView(image: uiImage)
//        let dummyContainer = UIView()
//        dummyContainer.addSubview(imageView)
//        scrollView.addSubview(dummyContainer)






//        scrollView.setContentOffset(CGPoint(x: 100, y: 100), animated: false)
        
        /*
        let temp = RotateHelperWithFunc()
        let rotateGesture = UIRotationGestureRecognizer(target: self, action:     #selector(temp.handleRotate(_:)))
        scrollView.addGestureRecognizer(rotateGesture)
         */
    




//        imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
         
        
        
//        imageView.transform = CGAffineTransform(rotationAngle: radians);
        
//        scrollView.contentSize.height = frameHeight
//        scrollView.frame.origin.y = -200




//        scrollView.transform = CGAffineTransform(rotationAngle: radians)




//        let widthScale = viewSize.width / uiImage.size.width
//        let heightScale = viewSize.height / uiImage.size.height
        
//        let tempRect = CGRect(x: 0, y: 0, width: uiImage.size.width, height: uiImage.size.height)
//        let tempTransform = CGAffineTransform(rotationAngle: CGFloat(rotateHelper.rotateByAngle))
//        let newRect = tempRect.applying(tempTransform)
//
//        let fittingRect = AVMakeRect(aspectRatio: aspectRatioSize, insideRect: newRect)
        




//        let currentZoomScale = scrollView.zoomScale



//        newImage = uiImage
        
        /*
        let imageView1 = UIImageView(image: newImage)
        let dummyContainer = UIView()
        dummyContainer.addSubview(imageView1)
        scrollView.addSubview(dummyContainer)
        */






//        let tr = CGAffineTransform.identity.rotated(by: radians)
//        scrollView.subviews.first?.transform = tr
        
        
        /*
        let temp = RotateHelperWithFunc()
        let rotateGesture = UIRotationGestureRecognizer(target: self, action:     #selector(temp.handleRotate(_:)))
        imageView1.addGestureRecognizer(rotateGesture)
         */
        




//        imageView1.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
//        imageView1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
//        imageView1.transform = CGAffineTransform(rotationAngle: radians);
        




//        context.coordinator.zoomableView = imageView
//        let topConstraint = scrollView.constraints.first { $0.identifier == Constraint.top.rawValue }
//        let leadingConstraint = scrollView.constraints.first { $0.identifier == Constraint.leading.rawValue }
//        context.coordinator.topConstraint = topConstraint1
//        context.coordinator.leadingConstraint = leadingConstraint1
//        context.coordinator.trailingConstraint = trailingConstraint
////        context.coordinator.bottomConstraint = bottomConstraint



//        context.coordinator.croppedImage = croppedImage

        // Set initial zoom scale
//        if currentZoomScale >= minimumZoomScale && currentZoomScale <= minimumZoomScale*10{
//            scrollView.zoomScale = currentZoomScale
//        }
//        else{
//            scrollView.zoomScale = minimumZoomScale
//        }







/*
let fullWidth = imageSize!.width * cos(CGFloat(angleRotation!) * .pi/180) + imageSize!.height * sin(CGFloat(angleRotation!) * .pi/180)

let fullHeight = imageSize!.height * cos(CGFloat(angleRotation!) * .pi/180) + imageSize!.width * sin(CGFloat(angleRotation!) * .pi/180)
   
let zoomScale = scrollView.zoomScale
let xOffset = scrollView.contentOffset.x / zoomScale + horizontalOffsetNew / zoomScale
let yoffset = scrollView.contentOffset.y / zoomScale + verticalOffsetNew / zoomScale

let pt1 = CGPoint(x: 0, y: imageSize!.height * cos(CGFloat(angleRotation!) * .pi/180))
let pt2 = CGPoint(x: imageSize!.height * sin(CGFloat(angleRotation!) * .pi/180), y: 0)
let pt3 = CGPoint(x: fullWidth, y: imageSize!.width * sin(CGFloat(angleRotation!) * .pi/180))
let pt4 = CGPoint(x: imageSize!.width * cos(CGFloat(angleRotation!) * .pi/180), y: fullHeight)


let ptCheck1 = CGPoint(x: xOffset, y: yoffset)
let ptCheck2 = CGPoint(x: xOffset, y: yoffset + frameHeight!)
let ptCheck3 = CGPoint(x: xOffset + frameWidth!, y: xOffset + frameHeight!)
let ptCheck4 = CGPoint(x: xOffset + frameWidth!, y: yoffset)


let checkValue1 = ((ptCheck1.x - pt1.x) * (pt2.y - pt1.y)) - ((ptCheck1.y - pt1.y) * (pt2.x - pt1.x))

let checkValue2 = ((ptCheck2.x - pt1.x) * (pt4.y - pt1.y)) - ((ptCheck2.y - pt1.y) * (pt4.x - pt1.x))

let checkValue3 = ((ptCheck3.x - pt3.x) * (pt4.y - pt3.y)) - ((ptCheck3.y - pt3.y) * (pt4.x - pt3.x))

let checkValue4 = ((ptCheck4.x - pt2.x) * (pt3.y - pt2.y)) - ((ptCheck4.y - pt2.y) * (pt3.x - pt2.x))

if checkValue1 > 0 {
    let centerX = scrollView.subviews.first!.frame.size.width/2 - frameWidth!/2
    let centerY = scrollView.subviews.first!.frame.size.height/2 - frameHeight!/2
    let anim = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
        scrollView.isScrollEnabled = false
        scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
            scrollView.isScrollEnabled = true
    }
    anim.startAnimation()
}

if checkValue2 < 0 {
    let centerX = scrollView.subviews.first!.frame.size.width/2 - frameWidth!/2
    let centerY = scrollView.subviews.first!.frame.size.height/2 - frameHeight!/2
    let anim = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
        scrollView.isScrollEnabled = false
        scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
            scrollView.isScrollEnabled = true
    }
    anim.startAnimation()
}

if checkValue3 > 0 {
    let centerX = scrollView.subviews.first!.frame.size.width/2 - frameWidth!/2
    let centerY = scrollView.subviews.first!.frame.size.height/2 - frameHeight!/2
    let anim = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
        scrollView.isScrollEnabled = false
        scrollView.setContentOffset(CGPoint(x: centerX, y: centerY), animated: false)
            scrollView.isScrollEnabled = true
    }
    anim.startAnimation()
}

if checkValue4 > 0 {
    let centerX = scrollView.subviews.first!.frame.size.width/2 - frameWidth!/2
    let centerY = scrollView.subviews.first!.frame.size.height/2 - frameHeight!/2
    let anim = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
        scrollView.isScrollEnabled = false
        scrollView.setContentOffset(CGPoint(x: centerX, y: centerY), animated: false)
            scrollView.isScrollEnabled = true
    }
    anim.startAnimation()
}


*/









/*
let topSet = (Float(frameWidth!) * cos(angleRotation! * .pi/180) * sin(angleRotation! * .pi/180)) - Float(verticalOffset!)
   
let horizSet = (Float(frameHeight!) * cos(angleRotation! * .pi/180) * sin(angleRotation! * .pi/180)) - Float(horizontalOffset!)
 */















/*
if freeformSelected {
    Image(name: "corner-png")
//                                                 .font(.system(size: 20))
//                                                 .background(Circle().frame(width: 30, height: 30).foregroundColor(.white))
        .frame(width: frameWidth, height: frameHeight, alignment: .topLeading)
        .foregroundColor(.black)
//                                                 .offset(x: -5, y: -5)
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
 */









/*

import SwiftUI


var printValue: CGFloat = 0
var prevPrintValue: CGFloat = 0

struct SliderSetup: View {

    @Binding var offsetCheck: CGFloat
    @Binding var offset: CGPoint
    @EnvironmentObject var rotateHelper: RotateHelper

        var body: some View {
            VStack {
                GeometryReader { geo in
                    ZStack {
                        UIScrollViewWrapper(offset: $offset, offsetCheck: $offsetCheck) { //
                            HStack {
                                ForEach(-60...60, id: \.self) { text in
                                    if text >= -45 && text <= 45 {
                                        Text(".")
                                            .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255, opacity: 0.8))
                                            .font(.title)
                                    }
                                    else{
                                        Text("")
                                    }
                                        
                                }
                            }
                            .background(.black)
                        }
                        
                        ZStack {
                            
                            Rectangle()
                                .background(.black)
                                .foregroundColor(.black)
                                .frame(width: 50, height: 30)
                            
                            HStack {
                                Text("\(Int(rotateHelper.rotateByAngle))")
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .font(.title2)
                                .frame(height: 30)
                                
                                Image(systemName: "circle")
                                    .font(.system(size: 7))
                                    .foregroundColor(.white)
                                    .offset(x: -3, y: -5)
                            }
                        }
                        .allowsHitTesting(false)
                    }
                }
                .frame(width: 250, height: 50, alignment: .center)
                .background(.black)
                
                
                HStack {
                    Text(offset.debugDescription)
                }
                .frame(width: 0, height: 0)
               
                 
            }
        }
}

//struct ScrollViewHoriz_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollViewHoriz(offsetCheck: .constant(CGFloat(0)), offset: .constant(CGPoint(x: 1317/2, y: 0)))
//    }
//}






class UIScrollViewViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.isPagingEnabled = false
        v.alwaysBounceHorizontal = true
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
        return v
    }()

    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        pinEdges(of: scrollView, to: view)

        hostingController.willMove(toParent: self)
        scrollView.addSubview(hostingController.view)
        pinEdges(of: hostingController.view, to: scrollView)
        hostingController.didMove(toParent: self)
    }

    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
        ])
    }
}

struct UIScrollViewWrapper<Content: View>: UIViewControllerRepresentable {
    var content: () -> Content
    @Binding var offset: CGPoint
    @Binding var offsetCheck: CGFloat
    init(offset: Binding<CGPoint>, offsetCheck: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        _offset = offset
        _offsetCheck = offsetCheck
    }

    func makeCoordinator() -> Controller {
        return Controller(parent: self)
    }

    func makeUIViewController(context: Context) -> UIScrollViewViewController {
        let vc = UIScrollViewViewController()
        vc.scrollView.contentInsetAdjustmentBehavior = .never
        vc.hostingController.rootView = AnyView(content())
        vc.view.layoutIfNeeded()
        vc.scrollView.contentOffset = offset
        vc.scrollView.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ viewController: UIScrollViewViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(content())
        viewController.scrollView.contentOffset = offset
    }

    class Controller: NSObject, UIScrollViewDelegate {
        var parent: UIScrollViewWrapper<Content>
        init(parent: UIScrollViewWrapper<Content>) {
            self.parent = parent
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset
            printValue = parent.offset.x - 1445/2
            parent.offsetCheck = printValue
        
        }
    }
}
*/









//                    Spacer()
                    
                    /*
                    HStack{
                        Button(action: {
                            isShowingEditingView = true
                        }) {
                            Image(systemName: "crop")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding()
                        
                        Button(action: {
                            isShowingFilterView = true
                        }) {
                            Image(systemName: "camera.filters")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding()
                    }
                    .onAppear{
                        if isCropped{
                            imageToShow = finalImageCropped
                        }
                        else{
                            imageToShow = uiImage
                        }
                    }
                     
                     */






