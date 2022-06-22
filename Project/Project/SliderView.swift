//
//  SliderView.swift
//  Project
//
//  Created by Mitansh Khurana on 22/06/22.
//

import SwiftUI

struct SliderView: View {
    
    @State var sliderValue: Float = 0
    
    var body: some View {
        
        Text("Hi")
        
//        ScrollView {
//                ZStack {
//                    LazyVStack {
//                        ForEach(0...100, id: \.self) { index in
//                            Text("Row \(index)")
//                        }
//                    }
//                    GeometryReader { proxy in
//                        let offset = proxy.frame(in: .named("scroll")).minY
//                        Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
//                    }
//                }
//            }
//            .coordinateSpace(name: "scroll")
//            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
//                print(value)
//            }
        
        /*
        VStack{
            HStack {
                
                Text("Hi")
                    .padding()
                
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach (0...20, id: \.self) { value in
                                Text(".")
                                    .font(.title)
                                    
                            }
                            
                        }
        //                .frame(width: 100)
                    }
                    
                    Text("Hi")
                        .frame(width: 30, height: 30)
                        .background(.white)
                }
                
                Text("Hi")
                    .padding()
            }
        
        }
        */
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
