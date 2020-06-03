//
//  ContentView.swift
//  PWSwipeViewDemo
//
//  Created by Pranav Wadhwa on 6/2/20.
//  Copyright © 2020 Pranav Wadhwa. All rights reserved.
//

import SwiftUI
import PWSwipeView

struct ContentView: View {
    
    var viewControllers = [UIViewController]()
    
    @State var currentPage = 0
    let continuousPaging = true
    
    init() {
        let subviews = [
            Subview(title: "Hello from Page 1", bg: Color("custom-1")),
            Subview(title: "Hello from Page 2", bg: Color("custom-2")),
            Subview(title: "Hello from Page 3", bg: Color("custom-3")),
            Subview(title: "Hello from Page 4", bg: Color("custom-4"))
        ]
        viewControllers = subviews.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            SwipeView(viewControllers: viewControllers, currentPage: $currentPage, isContinuous: continuousPaging)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .background(Color.black)
                        .cornerRadius(4)
                        .opacity(self.currentPage == 0 ? 1 : 0.3)
                        .animation(Animation.linear)
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .background(Color.black)
                        .cornerRadius(4)
                        .opacity(self.currentPage == 1 ? 1 : 0.3)
                        .animation(Animation.linear)
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .background(Color.black)
                        .cornerRadius(4)
                        .opacity(self.currentPage == 2 ? 1 : 0.3)
                        .animation(Animation.linear)
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .background(Color.black)
                        .cornerRadius(4)
                        .opacity(self.currentPage == 3 ? 1 : 0.3)
                        .animation(Animation.linear)
                    
                }
            }
        }
    }
}
