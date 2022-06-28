//
//  SliderView.swift
//  Project
//
//  Created by Mitansh Khurana on 22/06/22.
//

import SwiftUI

struct SliderView: View {
    
    
    
    var body: some View {
        
        
        HStack {
            
            Text("Hi")
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader {value in
                    
                    Button(action: {
                        value.scrollTo(30)
                    }) {
                        Text("Scroll")
                    }
                    
                    HStack {
                        ForEach(-70...70, id:\.self){index in
                            if index >= -45 && index <= 45 {
                                Text("\(index)")
                            }
                            else{
                                Text("")
                            }
                        }
                    }
                    onAppear{
//                        value.scrollTo(8)
                    }
                }
            }
            
            Text("Hi")
                .padding()
        }
    }
}






struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
