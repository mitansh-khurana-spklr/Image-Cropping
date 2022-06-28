//
//  DemoScrollViewOffsetView.swift
//  Project
//
//  Created by Mitansh Khurana on 22/06/22.
//

import SwiftUI

struct DemoScrollViewOffsetView: View {
    @State private var offset = CGFloat.zero
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<100) { i in
                    Text("Item \(i)").padding()
                }
            }.background(GeometryReader {
                Color.clear.preference(key: ViewOffsetKey.self,
                    value: -$0.frame(in: .named("scroll")).origin.x)
            })
            .onPreferenceChange(ViewOffsetKey.self) { print("offset >> \($0)") }
        }.coordinateSpace(name: "scroll")
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct DemoScrollViewOffsetView_Previews: PreviewProvider {
    static var previews: some View {
        DemoScrollViewOffsetView()
    }
}
