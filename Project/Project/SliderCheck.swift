//
//  SliderCheck.swift
//  Project
//
//  Created by Mitansh Khurana on 27/06/22.
//

import SwiftUI

struct SliderCheck: View {
    @State var offsetCheck: CGFloat = 0
    @State var offset: CGPoint = CGPoint(x: 1297.3/2, y: 0)
    var body: some View {
        VStack {
//            Image(systemName: lines.measurement.horizontal)
            GeometryReader { geo in
                ZStack {
                    UIScrollViewWrapper(offset: $offset, offsetCheck: $offsetCheck) { //
                        HStack {
                            ForEach(-60...60, id: \.self) { text in
                                if text >= -45 && text <= 45 {
                                    if text == 0 {
                                        Image(systemName: "minus")
                                            .rotation3DEffect(.degrees(90), axis: (x: 0, y: 0, z: 1))
                                            .foregroundColor(.white)
                                            .font(.title2)
                                            .offset(y: 15)
//                                            .opacity(0.9)
                                    }
                                    else if text % 5 == 0 {
                                        Image(systemName: "minus")
                                            .rotation3DEffect(.degrees(90), axis: (x: 0, y: 0, z: 1))
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                            .offset(y: 15)
//                                            .opacity(0.8)
                                    }
                                    else {
                                        Text(".")
                                            .foregroundColor(.white)
                                            .offset(y: 10)
                                            .opacity(0.8)
//                                            .font(.title3)
                                    }
                                    
                                }
                                else{
                                    Text("")
                                }
                                    
                            }
                        }
                        .background(.black)
                    }
                    
                    Image(systemName: "minus")
                        .rotation3DEffect(.degrees(90), axis: (x: 0, y: 0, z: 1))
                        .foregroundColor(.blue)
                        .font(.system(size: 40))
                        .offset(y: 0)
                    
                    
                    /*
                    ZStack {
                        
                        Rectangle()
                            .background(.black)
                            .foregroundColor(.black)
                            .frame(width: 50, height: 30)
                        
                        HStack {
                            Text("\(Int((offsetCheck*45)/(1297/2)))")
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
                     */
                }
            }
            .frame(width: 250, height: 50, alignment: .center)
            .background(.black)
            
            
            HStack {
                Text(offset.debugDescription)
            }
//            .frame(width: 0, height: 0)
        }
    }
}

struct SliderCheck_Previews: PreviewProvider {
    static var previews: some View {
        SliderCheck()
    }
}
