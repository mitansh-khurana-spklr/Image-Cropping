//
//  ZoomAndScroll.swift
//  Project
//
//  Created by Mitansh Khurana on 14/06/22.
//

import Foundation
import SwiftUI
import UIKit
import AVFoundation


var scroll = UIScrollView()
var horizontalOffsetNew = CGFloat(0)
var verticalOffsetNew = CGFloat(0)
var rotateAngle : Float = 0
var newImage = UIImage()
var flippedNewImage = UIImage()
var prevFlipped = false
var prevAspectRatio = CGFloat(1)
var contentOffsetState = CGPoint(x: 0, y: 0)
var zoomscaleState : CGFloat = 1
var prevZoomscaleState: CGFloat = 1
var firstLoad = true
var isRotated90 = false
var rotateTo = 0
var isFlipPressed = false
var aspectState: CGFloat = 1
var rotationState: Float = 0
var freeFormState: Bool = false
var flipState = false
var dontChange = false

struct ZoomableView: UIViewRepresentable {
    @Binding var uiImage: UIImage
    let viewSize: CGSize
    
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    @Binding var rotation: Float
    @Binding var aspectRatioSize: CGSize
    @Binding var isOriginal: Bool
    @Binding var currFlipped: Bool
    @Binding var aspectRatio: CGFloat
    
    
    @EnvironmentObject var rotateHelper: RotateHelper


    private enum Constraint: String {
        case top
        case leading
        case bottom
        case trailing
    }
    
    // Minimum zoom
    private var minimumZoomScale: CGFloat {        
        
        let dx1 = frameWidth * cos(CGFloat(rotateHelper.rotateByAngle) * .pi/180) + frameHeight * sin(CGFloat(rotateHelper.rotateByAngle) * .pi/180)
        
        let dy1 = frameHeight * cos(CGFloat(rotateHelper.rotateByAngle) * .pi/180) + frameWidth * sin(CGFloat(rotateHelper.rotateByAngle) * .pi/180)
        
        var dx = dx1
        var dy = dy1
        
        if rotateHelper.rotateByAngle <= 90 {
            dx = frameWidth * cos(CGFloat(rotateHelper.rotateByAngle) * .pi/180) + frameHeight * sin(CGFloat(rotateHelper.rotateByAngle) * .pi/180)
            dy = frameHeight * cos(CGFloat(rotateHelper.rotateByAngle) * .pi/180) + frameWidth * sin(CGFloat(rotateHelper.rotateByAngle) * .pi/180)
        }
        else if rotateHelper.rotateByAngle <= 180 {
            let modAngle = rotateHelper.rotateByAngle - 90
            dx = frameHeight * cos(CGFloat(modAngle) * .pi/180) + frameWidth * sin(CGFloat(modAngle) * .pi/180)
            dy = frameWidth * cos(CGFloat(modAngle) * .pi/180) + frameHeight * sin(CGFloat(modAngle) * .pi/180)
        }
        else if rotateHelper.rotateByAngle <= 270 {
            let modAngle = rotateHelper.rotateByAngle - 180
            dx = frameWidth * cos(CGFloat(modAngle) * .pi/180) + frameHeight * sin(CGFloat(modAngle) * .pi/180)
            dy = frameHeight * cos(CGFloat(modAngle) * .pi/180) + frameWidth * sin(CGFloat(modAngle) * .pi/180)
        }
        else{
            let modAngle = rotateHelper.rotateByAngle - 270
            dx = frameHeight * cos(CGFloat(modAngle) * .pi/180) + frameWidth * sin(CGFloat(modAngle) * .pi/180)
            dy = frameWidth * cos(CGFloat(modAngle) * .pi/180) + frameHeight * sin(CGFloat(modAngle) * .pi/180)
        }
        
        
        let rectRatio = abs(dx / dy)
        let viewRatio =  uiImage.size.width / uiImage.size.height
        
        var scale : CGFloat = 1
        if rectRatio > viewRatio{
            scale = uiImage.size.width / abs(dx)
        }
        else{
            scale = uiImage.size.height / abs(dy)
        }
        
        return 1/scale
    }
    
    // Make scrollview
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        
        scrollView.delegate = context.coordinator
        scrollView.maximumZoomScale = minimumZoomScale * 10
        scrollView.minimumZoomScale = minimumZoomScale
        scrollView.bouncesZoom = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        
        verticalOffsetNew = (viewSize.height - frameHeight)/2
        horizontalOffsetNew = (viewSize.width - frameWidth)/2
        
        
        let imageView = UIImageView(image: uiImage)
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: verticalOffsetNew, left: horizontalOffsetNew, bottom: verticalOffsetNew, right: horizontalOffsetNew)
        
        // Autolayout constraints
        let topConstraint = imageView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        topConstraint.identifier = Constraint.top.rawValue
        topConstraint.isActive = true

        let leadingConstraint = imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        leadingConstraint.identifier = Constraint.leading.rawValue
        leadingConstraint.isActive = true

        let bottomConstraint = imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        bottomConstraint.identifier = Constraint.bottom.rawValue
        bottomConstraint.isActive = true

        let trailingConstraint = imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        trailingConstraint.identifier = Constraint.trailing.rawValue
        trailingConstraint.isActive = true
        
         
        let xInitalOffset = ((uiImage.size.width * minimumZoomScale) - frameWidth)/2 - horizontalOffsetNew
        let yInitialOffset = ((uiImage.size.height * minimumZoomScale) - frameHeight)/2 - verticalOffsetNew
        
        
        // Zoomscale persistence
        if firstLoad || isOriginal {
            scrollView.zoomScale = minimumZoomScale
            zoomscaleState = minimumZoomScale
            prevZoomscaleState = minimumZoomScale
            contentOffsetState = CGPoint(x: xInitalOffset, y: yInitialOffset)
        }
        else{
            if zoomscaleState >= minimumZoomScale && zoomscaleState <= 10*minimumZoomScale{
                scrollView.zoomScale = zoomscaleState
            }
            else{
                scrollView.zoomScale = minimumZoomScale
            }
            
        }
        
        // Offset persistence
        if firstLoad {
            firstLoad = false
        }
        else{
            scrollView.setContentOffset(contentOffsetState, animated: false)
        }
        
        scroll = scrollView
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        if rotateHelper.rotateByAngle != rotationState || isFlipPressed || currFlipped || isOriginal || flipState {
            let subviews = scrollView.subviews
            for subview in subviews{
                subview.removeFromSuperview()
            }
        }
        
        verticalOffsetNew = (viewSize.height - frameHeight)/2
        horizontalOffsetNew = (viewSize.width - frameWidth)/2
        
        let CGrotation = CGFloat(rotateHelper.rotateByAngle)
        let radians = CGrotation * Double.pi/180
        
        if rotateHelper.rotateByAngle != rotationState || isFlipPressed || currFlipped || isOriginal || flipState {
            newImage = uiImage.rotate(radians: Float(radians))!

            if flipState == true || currFlipped == true {
                newImage = newImage.flipHorizontally()!
            }
            
            let imageView1 = UIImageView(image: newImage)
            scrollView.addSubview(imageView1)
            imageView1.translatesAutoresizingMaskIntoConstraints = false
            
            let topConstraint1 = imageView1.topAnchor.constraint(equalTo: scrollView.topAnchor)
            topConstraint1.identifier = Constraint.top.rawValue
            topConstraint1.isActive = true

            let leadingConstraint1 = imageView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
            leadingConstraint1.identifier = Constraint.leading.rawValue
            leadingConstraint1.isActive = true

            let bottomConstraint = imageView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            bottomConstraint.identifier = Constraint.bottom.rawValue
            bottomConstraint.isActive = true

            let trailingConstraint = imageView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
            trailingConstraint.identifier = Constraint.trailing.rawValue
            trailingConstraint.isActive = true
        }
        
        
        let xInitalOffset = ((uiImage.size.width * minimumZoomScale) - frameWidth)/2 - horizontalOffsetNew
        let yInitialOffset = ((uiImage.size.height * minimumZoomScale) - frameHeight)/2 - verticalOffsetNew
        
    
        scrollView.contentInset = UIEdgeInsets(top: verticalOffsetNew, left: horizontalOffsetNew, bottom: verticalOffsetNew, right: horizontalOffsetNew)
        
        
        scrollView.minimumZoomScale = minimumZoomScale
        scrollView.maximumZoomScale = minimumZoomScale * 10
        
        guard let dummyView = scrollView.subviews.first else {
            return
        }
        
        // Inject dependencies into coordinator
        context.coordinator.zoomableView = dummyView
        context.coordinator.imageSize = uiImage.size
        context.coordinator.viewSize = viewSize
        context.coordinator.frameWidth = frameWidth
        context.coordinator.frameHeight = frameHeight
        context.coordinator.angleRotation = rotateHelper.rotateByAngle
        context.coordinator.minimumZoomScale = minimumZoomScale
        context.coordinator.verticalOffset = verticalOffsetNew
        context.coordinator.horizontalOffset = horizontalOffsetNew
        
         
        // Zoom persistence
        if firstLoad || isOriginal  {
            scrollView.zoomScale = minimumZoomScale
            zoomscaleState = minimumZoomScale
            prevZoomscaleState = minimumZoomScale
            contentOffsetState = CGPoint(x: xInitalOffset, y: yInitialOffset)
            
        }
        else{
            if zoomscaleState >= minimumZoomScale && zoomscaleState <= 10*minimumZoomScale{
                scrollView.zoomScale = zoomscaleState
            }
            else{
                scrollView.zoomScale = minimumZoomScale
                zoomscaleState = minimumZoomScale
                let centerX = (newImage.size.width * scrollView.zoomScale)/2 - viewSize.width/2
                let centerY = (newImage.size.height * scrollView.zoomScale)/2 - viewSize.height/2
                scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
                contentOffsetState.x = centerX
                contentOffsetState.y = centerY
                dontChange = true
            }
        }
        
        // Offset persistence
        if firstLoad {
            firstLoad = false
        }
        else{
            if dontChange {
                dontChange = false
            }
            else if rotateHelper.rotateByAngle != rotationState && !isRotated90 {
                let centerX = (newImage.size.width * scrollView.zoomScale)/2 - viewSize.width/2
                let centerY = (newImage.size.height * scrollView.zoomScale)/2 - viewSize.height/2
                scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
                contentOffsetState.x = centerX
                contentOffsetState.y = centerY
            }
            else if rotateHelper.rotateByAngle != rotationState || isFlipPressed || freeFormState || showingEditingSelection || isOriginal || flipState  {
                showingEditingSelection = false
                scrollView.setContentOffset(contentOffsetState, animated: false)
            }
        }
        
        // Offset persistence on rotation
        if isRotated90 {
            isRotated90 = false
            if isOriginal || (rotationState != 90 && rotationState != 180 && rotationState != 270 && rotationState != 0) {
                let centerX = (newImage.size.width * scrollView.zoomScale)/2 - viewSize.width/2
                let centerY = (newImage.size.height * scrollView.zoomScale)/2 - viewSize.height/2
                scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
                contentOffsetState.x = centerX
                contentOffsetState.y = centerY
            }
            else {
                let topOffsetOld = (viewSize.height - frameWidth)/2
                let leftOffsetOld = (viewSize.width - frameHeight)/2
                let topOffsetNew = (viewSize.height - frameHeight)/2
                let leftOffsetNew = (viewSize.width - frameWidth)/2
                let xOffsetNew = contentOffsetState.y + topOffsetOld - leftOffsetNew
                let yOffsetNew = (newImage.size.height * scrollView.zoomScale) - frameHeight - contentOffsetState.x - (leftOffsetOld) - topOffsetNew
                contentOffsetState.x = xOffsetNew
                contentOffsetState.y = yOffsetNew
                scrollView.setContentOffset(contentOffsetState, animated: false)
            }
            
            
        }
        
        // Offset persistence on flip
        if isFlipPressed {
            isFlipPressed = false
            
            if isOriginal {
                let centerX = (newImage.size.width * scrollView.zoomScale)/2 - viewSize.width/2
                let centerY = (newImage.size.height * scrollView.zoomScale)/2 - viewSize.height/2
                scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
                contentOffsetState.x = centerX
                contentOffsetState.y = centerY
            }
            else {
                let leftOffset = (viewSize.width - frameWidth)/2
                let xOffsetNew = (newImage.size.width * scrollView.zoomScale) - contentOffsetState.x - frameWidth - (2*leftOffset)
                contentOffsetState.x = xOffsetNew
                scrollView.setContentOffset(contentOffsetState, animated: false)
            }
            
        }
        
        rotationState = rotateHelper.rotateByAngle
        scroll = scrollView
    }
    
    
    // Cropping function
    static func crop(uiImage: UIImage, width: CGFloat, height: CGFloat) -> UIImage{
        let zoomScale = scroll.zoomScale
        let xOffset = scroll.contentOffset.x / zoomScale + horizontalOffsetNew / zoomScale
        let yoffset = scroll.contentOffset.y / zoomScale + verticalOffsetNew / zoomScale
        let cropWidth : CGFloat = width / zoomScale
        let cropHeight : CGFloat = height / zoomScale
        
        let rect = CGRect(x: xOffset, y: yoffset, width: cropWidth, height: cropHeight)
        let cgImage = uiImage.cgImage!
        let croppedCGImage = cgImage.cropping(to: rect)
        let croppedImage = UIImage(cgImage: croppedCGImage!)
        return croppedImage
    }
}

// MARK: - Coordinator

extension ZoomableView {
    class Coordinator: NSObject, UIScrollViewDelegate {
        var zoomableView: UIView?
        var imageSize: CGSize?
        var viewSize: CGSize?
        var topConstraint: NSLayoutConstraint?
        var leadingConstraint: NSLayoutConstraint?
        var trailingConstraint: NSLayoutConstraint?
        var bottomConstraint: NSLayoutConstraint?
        var verticalOffset: CGFloat?
        var horizontalOffset: CGFloat?
        var frameWidth: CGFloat?
        var frameHeight: CGFloat?
        var angleRotation: Float?
        var minimumZoomScale: CGFloat?

        // Specifying zoom view
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            zoomableView
        }
        
        // Setting offset upon ending drag
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            
            contentOffsetState.x = scrollView.contentOffset.x
            contentOffsetState.y = scrollView.contentOffset.y
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            var angleUsed = angleRotation!
            
            let imageHeight = imageSize!.height
            let imageWidth = imageSize!.width
            
            if angleRotation! < 90 {
                angleUsed = angleRotation!
            }
            else if angleRotation! < 180 {
                angleUsed = angleRotation! - 90
            }
            else if angleRotation! < 270 {
                angleUsed = angleRotation! - 180
            }
            else  {
                angleUsed = angleRotation! - 270
            }
            
            let zoomScale = scrollView.zoomScale
            let xOffset = scrollView.contentOffset.x / zoomScale + horizontalOffsetNew / zoomScale
            let yoffset = scrollView.contentOffset.y / zoomScale + verticalOffsetNew / zoomScale
            
            let fullWidth = imageWidth * cos(CGFloat(angleUsed) * .pi/180) + imageHeight * sin(CGFloat(angleUsed) * .pi/180)
            
            let fullHeight = imageHeight * cos(CGFloat(angleUsed) * .pi/180) + imageWidth * sin(CGFloat(angleUsed) * .pi/180)
               
            
            let pt1 = CGPoint(x: 0, y: imageHeight  * cos(CGFloat(angleUsed) * .pi/180))
            let pt2 = CGPoint(x: imageHeight * sin(CGFloat(angleUsed) * .pi/180), y: 0)
            let pt3 = CGPoint(x: fullWidth, y: imageWidth * sin(CGFloat(angleUsed) * .pi/180))
            let pt4 = CGPoint(x: imageWidth * cos(CGFloat(angleUsed) * .pi/180), y: fullHeight)
            
            
            let ptCheck1 = CGPoint(x: xOffset, y: yoffset)
            let ptCheck2 = CGPoint(x: xOffset, y: yoffset + frameHeight!)
            let ptCheck3 = CGPoint(x: xOffset + frameWidth!, y: xOffset + frameHeight!)
            let ptCheck4 = CGPoint(x: xOffset + frameWidth!, y: yoffset)
            
            
            let checkValue1 = ((ptCheck1.x - pt1.x) * (pt2.y - pt1.y)) - ((ptCheck1.y - pt1.y) * (pt2.x - pt1.x))
            
            let checkValue2 = ((ptCheck2.x - pt1.x) * (pt4.y - pt1.y)) - ((ptCheck2.y - pt1.y) * (pt4.x - pt1.x))
            
            let checkValue3 = ((ptCheck3.x - pt3.x) * (pt4.y - pt3.y)) - ((ptCheck3.y - pt3.y) * (pt4.x - pt3.x))
            
            let checkValue4 = ((ptCheck4.x - pt2.x) * (pt3.y - pt2.y)) - ((ptCheck4.y - pt2.y) * (pt3.x - pt2.x))
            
            if checkValue1 > 0 || checkValue2 < 0 || checkValue3 > 0 || checkValue4 > 0 {
                let centerX = (newImage.size.width * scrollView.zoomScale)/2 - viewSize!.width/2
                let centerY = (newImage.size.height * scrollView.zoomScale)/2 - viewSize!.height/2
                
                let anim = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
                    scrollView.isScrollEnabled = false
                    scrollView.setContentOffset(CGPoint(x: Int(centerX), y: Int(centerY)), animated: false)
                        scrollView.isScrollEnabled = true
                }
                anim.startAnimation()
            }
            contentOffsetState = scrollView.contentOffset
            
        }
        
        func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
            zoomscaleState = scrollView.zoomScale
            contentOffsetState.x = scrollView.contentOffset.x
            contentOffsetState.y = scrollView.contentOffset.y
        }

    }
}


extension UIImage {
    // rotate uiimage
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
    
    // flip uiimage
    func flipHorizontally() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
            
        context.translateBy(x: self.size.width/2, y: self.size.height/2)
        context.scaleBy(x: -1.0, y: 1.0)
        context.translateBy(x: -self.size.width/2, y: -self.size.height/2)
            
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
        return newImage
    }
}


class RotateHelper: ObservableObject{
    @Published var rotateByAngle: Float = 0
}
