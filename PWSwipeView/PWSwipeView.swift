//
//  PWSwipeView.swift
//  PWSwipeView
//
//  Created by Pranav Wadhwa on 6/3/20.
//  Copyright © 2020 Pranav Wadhwa. All rights reserved.
//

import SwiftUI

public struct SwipeView: UIViewControllerRepresentable {
    
    /// Index of the current page of the page view controller
    @Binding var currentPage: Int
    /// List of (hosting) view controllers that are being swiped through
    private var viewControllers: [UIViewController]
    /// Defines if the page view controller loops around
    private var isContinuous: Bool
    
    
    public func makeCoordinator() -> SwipeView.Coordinator {
        return Coordinator(self)
    }
    
    
    /// Initializes the SwipeView
    ///
    /// - Parameter viewControllers: An array of UIHostingControllers that will be swiped through
    /// - Parameter currentPage: Binding variable that will be updated with swipes
    /// - Parameter isContinuous: Defines if the page view controller will loop around
    public init(viewControllers: [UIViewController], currentPage: Binding<Int>, isContinuous: Bool = false) {
        self.viewControllers = viewControllers
        self._currentPage = currentPage
        self.isContinuous = isContinuous
    }
    
    public func makeUIViewController(context: Context) -> UIPageViewController {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageController.dataSource = context.coordinator
        pageController.delegate = context.coordinator

        return pageController
        
    }
    
    public func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<SwipeView>) {
        uiViewController.setViewControllers([viewControllers[currentPage]], direction: .forward, animated: true, completion: nil)

    }
    
    public class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        private var parent: SwipeView
        
        init(_ swipeView: SwipeView) {
            self.parent = swipeView
        }
        
        public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            guard completed else { return }
            
            
            if let currentVC = pageViewController.viewControllers?.first, let index = parent.viewControllers.firstIndex(of: currentVC) {
                parent.currentPage = index
            }
            
        }
        
        public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                 return nil
             }
            
            if index == 0 {
                return parent.isContinuous ? parent.viewControllers.last : nil
            }
            
            return parent.viewControllers[index - 1]
            
        }
        
        public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == parent.viewControllers.count - 1 {
                return parent.isContinuous ? parent.viewControllers.first : nil
            }
            return parent.viewControllers[index + 1]
        }
        
    }
    
    
}
