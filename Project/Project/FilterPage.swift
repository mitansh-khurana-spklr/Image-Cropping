//
//  FilterPage.swift
//  Project
//
//  Created by Mitansh Khurana on 28/06/22.
//

import SwiftUI

struct FilterPage: View {
    
    
    
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Spacer()
                
                Image("Landscape")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .padding()
                
                Spacer()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0...5, id: \.self){_ in
                            Button(action: {}) {
                                Image("Landscape")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 70)
                                    .clipped()
                            }
                            
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct FilterPage_Previews: PreviewProvider {
    static var previews: some View {
        FilterPage()
    }
}
