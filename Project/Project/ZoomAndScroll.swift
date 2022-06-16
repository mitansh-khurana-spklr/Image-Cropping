//
//  ZoomAndScroll.swift
//  Project
//
//  Created by Mitansh Khurana on 14/06/22.
//

import Foundation
import SwiftUI
import UIKit


//var imageView = UIImageView()

var scroll = UIScrollView()
var horizontalOffsetNew = CGFloat(0)
var verticalOffsetNew = CGFloat(0)


struct ZoomableView: UIViewRepresentable {
    @Binding var uiImage: UIImage
//    @Binding var frameWidth: CGFloat
//    @Binding var frameHeight: CGFloat
    let viewSize: CGSize
//    @Binding var horizontalOffset: CGFloat
//    @Binding var verticalOffset: CGFloat
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    
    @Binding var rotation: Float
    
    
//    @Binding var horizontalOffset: CGFloat
//    @Binding var verticalOffset: CGFloat
//    var croppedImage: UIImage
    
//    var imageView : UIImageView


    private enum Constraint: String {
        case top
        case leading
        case bottom
        case trailing
    }
    
    private var minimumZoomScale: CGFloat {
//        let widthScale = viewSize.width / uiImage.size.width
//        let heightScale = viewSize.height / uiImage.size.height
        
        
        let widthScale = frameWidth / uiImage.size.width
        let heightScale = frameHeight / uiImage.size.height
        return max(widthScale, heightScale)
    }
    
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
//        let imageView = UIImageView()
//        imageView.image = uiImage.withAlignmentRectInsets(UIEdgeInsets(top: -verticalOffset, left: -horizontalOffset, bottom: -verticalOffset/2, right: -horizontalOffset/2))
        
        
        
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: verticalOffsetNew, left: horizontalOffsetNew, bottom: verticalOffsetNew, right: horizontalOffsetNew)
    
        
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
        

//        imageView.transform = CGAffineTransform(rotationAngle: radians);
        
        scroll = scrollView
        
//        scrollView.transform = CGAffineTransform(rotationAngle: radians)
        
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        // reintializing imageview to take into consideration new image
        let subviews = scrollView.subviews
        for subview in subviews{
            subview.removeFromSuperview()
        }
        
        
        verticalOffsetNew = (viewSize.height - frameHeight)/2
        horizontalOffsetNew = (viewSize.width - frameWidth)/2
        
        let CGrotation = CGFloat(rotation)
        let radians = CGrotation * Double.pi/180
        
        let newImage = uiImage.rotate(radians: Float(radians))
        
        let imageView1 = UIImageView(image: newImage)
//        let imageView1 = UIImageView()
//        imageView1.image = uiImage.withAlignmentRectInsets(UIEdgeInsets(top: -verticalOffset, left: -horizontalOffset, bottom: -verticalOffset/2, right: -horizontalOffset/2))
        scrollView.addSubview(imageView1)
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.contentInset = UIEdgeInsets(top: verticalOffsetNew, left: horizontalOffsetNew, bottom: verticalOffsetNew, right: horizontalOffsetNew)
        
        
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
        
        
//        imageView1.transform = CGAffineTransform(rotationAngle: radians);
        
        
        scrollView.minimumZoomScale = minimumZoomScale
        scrollView.maximumZoomScale = minimumZoomScale * 10
        

    
        
        
        guard let imageView = scrollView.subviews.first as? UIImageView else {
            return
        }
        
        // Inject dependencies into coordinator
        context.coordinator.zoomableView = imageView
        context.coordinator.imageSize = uiImage.size
        context.coordinator.viewSize = viewSize
//        let topConstraint = scrollView.constraints.first { $0.identifier == Constraint.top.rawValue }
//        let leadingConstraint = scrollView.constraints.first { $0.identifier == Constraint.leading.rawValue }
//        context.coordinator.topConstraint = topConstraint1
//        context.coordinator.leadingConstraint = leadingConstraint1
//        context.coordinator.trailingConstraint = trailingConstraint
////        context.coordinator.bottomConstraint = bottomConstraint
//        context.coordinator.verticalOffset = verticalOffset
//        context.coordinator.horizontalOffset = horizontalOffset
        
//        context.coordinator.croppedImage = croppedImage

        // Set initial zoom scale
        scrollView.zoomScale = minimumZoomScale
        
//        scrollView.transform = CGAffineTransform(rotationAngle: radians)
        
        scroll = scrollView
    }
    
    
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
//        var croppedImage: UIImage?

        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            zoomableView
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
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
        }
        
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            print("zoomScale = \(scrollView.zoomScale)")
            print("xoffset = \(scrollView.contentOffset.x)")
            print("yoffset = \(scrollView.contentOffset.y)")
        }
    }
}




extension UIImage {
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
}
