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
        Image(systemName: "cross.fill")
            .font(.system(size: 20))
            .background(Circle().frame(width: 40, height: 40).foregroundColor(.white).opacity(0.01))
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

//struct BottomLeadingButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomLeadingButtonView()
//    }
//}
