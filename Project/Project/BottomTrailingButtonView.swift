//
//  BottomTrailingButtonView.swift
//  Project
//
//  Created by Mitansh Khurana on 27/06/22.
//

import SwiftUI

struct BottomTrailingButtonView: View {
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    var geometry: GeometryProxy
    
    var body: some View {
        Image(systemName: "cross.fill")
            .font(.system(size: 20))
            .background(Circle().frame(width: 40, height: 40).foregroundColor(.white).opacity(0.01))
            .frame(width: frameWidth, height: frameHeight, alignment: .bottomTrailing)
            .foregroundColor(.white)
            .offset(x: 10.5, y: 10)
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
               }))
    }
}

//struct BottomTrailingButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomTrailingButtonView()
//    }
//}
