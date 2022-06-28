//
//  TestSliderView.swift
//  Project
//
//  Created by Mitansh Khurana on 23/06/22.
//

import SwiftUI

struct TestSliderView: View {
    @State var sliderValue: Double = 0
    var body: some View {
        VStack {
            
            Text("\(sliderValue)")
            
            FilterSlider(value: $sliderValue, range: (-45, 45), lable: "Hello", defaultValue: 0, rangeDisplay: (-45, 45), spacing: 1)
                .padding()
        }
    }
}

struct TestSliderView_Previews: PreviewProvider {
    static var previews: some View {
        TestSliderView()
    }
}






