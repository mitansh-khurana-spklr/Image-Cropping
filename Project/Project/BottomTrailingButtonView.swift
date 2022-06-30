//
//  BottomTrailingButtonView.swift
//  Project
//
//  Created by Mitansh Khurana on 27/06/22.
//

import SwiftUI

// Freeform corner bottom trailing
struct BottomTrailingButtonView: View {
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            Image(systemName: "minus")
                .font(.system(size: 50))
                .background(Rectangle().frame(width: 60, height: 60).foregroundColor(.white).opacity(0.02))
                .frame(width: frameWidth, height: frameHeight, alignment: .bottomTrailing)
                .foregroundColor(.white)
                .offset(x: 8, y: 5)
                .gesture(DragGesture()
                   .onChanged{drag in
                       
                   }
                   .onEnded({ drag in
                       var tempFrameWidth = frameWidth
                       var tempFrameHeight = frameHeight
                       let widthTranslation = drag.translation.width
                       let heightTranslation = drag.translation.height
                       tempFrameWidth += widthTranslation
                       tempFrameHeight += heightTranslation
                       
                       print("drag width = \(drag.translation.width)")
                       print("drag height =\(drag.translation.height)")
                       print("width =\(widthTranslation)")
                       print("height =\(heightTranslation)")
                       print("frame width = \(tempFrameWidth)")
                       print("frame height = \(tempFrameHeight)")
                       
                       
                       if tempFrameWidth < 100 {
                           tempFrameWidth = 100
                       }
                       if tempFrameHeight < 100 {
                           tempFrameHeight = 100
                       }
                       if tempFrameWidth > (geometry.size.width - 50) {
                           tempFrameWidth = geometry.size.width - 50
                       }
                       if tempFrameHeight > (geometry.size.height - 50){
                           tempFrameHeight = geometry.size.height - 50
                       }
                       
                       frameWidth = tempFrameWidth
                       frameHeight = tempFrameHeight
               }))
            
            
            Image(systemName: "minus")
                .rotation3DEffect(.degrees(90), axis: (x: 0, y: 0, z: 1))
                .font(.system(size: 50))
                .background(Rectangle().frame(width: 60, height: 60).foregroundColor(.white).opacity(0.02))
                .frame(width: frameWidth, height: frameHeight, alignment: .bottomTrailing)
                .foregroundColor(.white)
                .offset(x: 25, y: -12)
                .gesture(DragGesture()
                   .onChanged{drag in
                       
                   }
                   .onEnded({ drag in
                       var tempFrameWidth = frameWidth
                       var tempFrameHeight = frameHeight
                       let widthTranslation = drag.translation.width
                       let heightTranslation = drag.translation.height
                       tempFrameWidth += widthTranslation
                       tempFrameHeight += heightTranslation
                       
                       print("drag width = \(drag.translation.width)")
                       print("drag height =\(drag.translation.height)")
                       print("width =\(widthTranslation)")
                       print("height =\(heightTranslation)")
                       print("frame width = \(tempFrameWidth)")
                       print("frame height = \(tempFrameHeight)")
                       
                       
                       if tempFrameWidth < 100 {
                           tempFrameWidth = 100
                       }
                       if tempFrameHeight < 100 {
                           tempFrameHeight = 100
                       }
                       if tempFrameWidth > (geometry.size.width - 50) {
                           tempFrameWidth = geometry.size.width - 50
                       }
                       if tempFrameHeight > (geometry.size.height - 50){
                           tempFrameHeight = geometry.size.height - 50
                       }
                       
                       frameWidth = tempFrameWidth
                       frameHeight = tempFrameHeight
               }))
        } 
    }
}

