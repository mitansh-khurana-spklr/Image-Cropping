//
//  AspectButtonsView.swift
//  Project
//
//  Created by Mitansh Khurana on 22/06/22.
//

import SwiftUI

struct AspectButtonsView: View {
    
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
                    ForEach(0...aspectRatioList.count, id:\.self){index in
                        
                        let first = aspectRatioList[index][0]
                        let second = aspectRatioList[index][1]
                        
                            
                        if aspectRatioList[index][2] == CGFloat(0) {
                            Button(action: {
                                withAnimation(.default){
                                    
                                    
                                    if aspectRatio == first/second{
                                        aspectRatioList[index][2] = CGFloat(1)
                                    }
                                    
                                    aspectRatio = first/second
                                    aspectRatioSize.width = first
                                    aspectRatioSize.height = second
                                                
                                            
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
                                        
                                    alignment = "vertical"
                                     
                                }
                            }) {
                                VStack {
                                    
                                    Rectangle()
                                        .frame(width: 20, height: 20*second/first)
                                        .opacity(0.6)
                                        .border(.white, width: 2)
                                        .padding(.bottom, 6)
                                        .foregroundColor(.white)
                                        
                                        
                                        
                                    Text("\(Int(first)) : \(Int(second))")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                     
                                }
                                     
                                .frame(width: 70, height: 70)
                                .background(aspectRatio == first/second ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
                                .cornerRadius(10)
                            }
                        }
                        else{
                            Button(action: {
                                        
                            withAnimation(.default){
                                
                                if aspectRatio == second/first{
                                    aspectRatioList[index][2] = CGFloat(0)
                                }
                                
                                aspectRatio = second/first
                                aspectRatioSize.width = second
                                aspectRatioSize.height = first
                                            

                                frameHeight = min(totalGeometry.size.width, totalGeometry.size.height/2)
                                frameWidth = frameHeight * aspectRatio
                                portrait = true
                                        
                                verticalOffset = (totalGeometry.size.height - frameHeight)/2
                                            
                                horizontalOffset = (totalGeometry.size.width - frameWidth)/2
                                    
                                alignment = "horizontal"
                                 
                            }
                                        
                            }) {
                                
                                VStack {
                                    
                                    Rectangle()
                                        .frame(width: 20*second/first, height: 20)
                                        .opacity(0.6)
                                        .border(.white, width: 2)
                                        .padding(.bottom, 6)
                                        .foregroundColor(.white)

                                            
                                        
                                    Text("\(Int(second)) : \(Int(first))")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                     
                                }
                                .frame(width: 70, height: 70)
                                .background(aspectRatio == second/first ? Color(red: 15/255, green: 15/255, blue: 15/255, opacity: 1.0) : nil)
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.size.width)
                .padding(.horizontal)
            }
            
        }
        .padding([.vertical, .horizontal])
        .frame(height: 40)
    }
}

//struct AspectButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectButtonsView()
//    }
//}
