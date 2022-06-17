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
