//
//  BottomLeadingButtonView.swift
//  Project
//
//  Created by Mitansh Khurana on 27/06/22.
//

import SwiftUI

struct BottomLeadingButtonView: View {
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    var geometry: GeometryProxy
    
    var body: some View {
        /*
        Image(systemName: "cross.fill")
            .font(.system(size: 20))
            .background(Rectangle().frame(width: 40, height: 40).foregroundColor(.white).opacity(0.01))
            .frame(width: frameWidth, height: frameHeight, alignment: .bottomLeading)
            .foregroundColor(.white)
            .offset(x: -10.5, y: 10)
            .gesture(DragGesture()
               .onEnded{drag in
                   var tempFrameWidth = frameWidth
                   var tempFrameHeight = frameHeight
                   tempFrameWidth -= drag.translation.width
                   tempFrameHeight += drag.translation.height
                   
                   if tempFrameWidth < 60 {
                       tempFrameWidth = 60
                   }
                   if tempFrameHeight < 60 {
                       tempFrameHeight = 60
                   }
                   if tempFrameWidth > (geometry.size.width - 30) {
                       tempFrameWidth = geometry.size.width - 30
                   }
                   if tempFrameHeight > (geometry.size.height - 30){
                       tempFrameHeight = geometry.size.height - 30
                   }
                   
                   frameWidth = tempFrameWidth
                   frameHeight = tempFrameHeight
               })
         */
        
        ZStack {
            Image(systemName: "minus")
                .font(.system(size: 50))
                .background(Rectangle().frame(width: 60, height: 60).foregroundColor(.white).opacity(0.01))
                .frame(width: frameWidth, height: frameHeight, alignment: .bottomLeading)
                .foregroundColor(.white)
                .offset(x: -8, y: 5)
                .gesture(DragGesture()
                   .onEnded{drag in
                       var tempFrameWidth = frameWidth
                       var tempFrameHeight = frameHeight
                       tempFrameWidth -= drag.translation.width
                       tempFrameHeight += drag.translation.height
                       
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
               })
            
            Image(systemName: "minus")
                .rotation3DEffect(.degrees(90), axis: (x: 0, y: 0, z: 1))
                .font(.system(size: 50))
                .background(Rectangle().frame(width: 60, height: 60).foregroundColor(.white).opacity(0.01))
                .frame(width: frameWidth, height: frameHeight, alignment: .bottomLeading)
                .foregroundColor(.white)
                .offset(x: -25, y: -12)
                .gesture(DragGesture()
                   .onEnded{drag in
                       var tempFrameWidth = frameWidth
                       var tempFrameHeight = frameHeight
                       tempFrameWidth -= drag.translation.width
                       tempFrameHeight += drag.translation.height
                       
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
               })
        }
        
        
        
        
    }
}

//struct BottomLeadingButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomLeadingButtonView()
//    }
//}
