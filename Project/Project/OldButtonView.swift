//
//  OldButtonView.swift
//  Project
//
//  Created by Mitansh Khurana on 22/06/22.
//

import SwiftUI

struct OldButtonView: View {
    
    
    @Binding var aspectRatio: CGFloat
    @Binding var aspectRatioSize: CGSize
    @Binding var portrait: Bool
    @Binding var aspectRatioList: [[CGFloat]]
    @Binding var alignment: String
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    @Binding var verticalOffset: CGFloat
    @Binding var horizontalOffset: CGFloat
    
    var totalGeometry: GeometryProxy
    @EnvironmentObject var rotateHelper: RotateHelper
    
    
    
    var body: some View {
        HStack {
                      ScrollView(.horizontal, showsIndicators: false){
                          HStack{
                              if(alignment == "Horizontal"){
                                  ForEach(aspectRatioListHorizontal, id:\.self){aspect in
                                          
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
                                                  .font(.body)
                                          }
                                          .frame(width: 70, height: 70)
                                          .background(aspectRatio == aspect[0]/aspect[1] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
                                          .cornerRadius(10)
      //                                                    .padding(.horizontal)
      //                                                    .overlay(aspectRatio == aspect[0]/aspect[1] ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
                                      }
                                  }
                              }
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
                                                  .font(.body)
                                          }
                                          .frame(width: 70, height: 70)
                                          .background(aspectRatio == aspect[0]/aspect[1] ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
                                          .cornerRadius(10)
      //                                                    .padding(.horizontal)
      //                                                    .overlay(aspectRatio == aspect[0]/aspect[1] ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil)
                                      
                                      }
                                  }
                              }
                              
                          }
                          .frame(minWidth: UIScreen.main.bounds.size.width)
                          .padding(.horizontal)
                      }
                      
                  }
                  .padding([.vertical, .horizontal])
                  .frame(height: 80)
    }
}

//struct OldButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        OldButtonView()
//    }
//}
