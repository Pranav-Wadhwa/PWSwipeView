//
//  Subview.swift
//  PWSwipeViewDemo
//
//  Created by Pranav Wadhwa on 6/3/20.
//  Copyright © 2020 Pranav Wadhwa. All rights reserved.
//

import SwiftUI

struct Subview: View {
    var title: String
    var bg: Color
    var body: some View {
        VStack {
            Text(title)
                .font(Font.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [bg.opacity(0.85), bg]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(title: "Hello, World!", bg: Color.blue)
    }
}
