//
//  PWSwipeView.swift
//  PWSwipeView
//
//  Created by Pranav Wadhwa on 6/3/20.
//  Copyright © 2020 Pranav Wadhwa. All rights reserved.
//

import SwiftUI

struct PWSwipeView: UIViewControllerRepresentable {
    
    var viewControllers: [UIViewController]
    var currentIndex: Int = 0
    var handler: PWSwipeViewHandler?
    
    func makeCoordinator() -> PWSwipeView.Coordinator {
        
        return Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageController.dataSource = context.coordinator
        pageController.delegate = context.coordinator

        return pageController
        
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PWSwipeView>) {
        uiViewController.setViewControllers([viewControllers.first!], direction: .forward, animated: true, completion: nil)
        
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var handler: PWSwipeViewHandler?
        var parent: PWSwipeView
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
        {
            
            if (!completed) {
                return
            }
            self.parent.currentIndex = self.parent.viewControllers.firstIndex(of: pageViewController.viewControllers!.first!) ?? -1
            self.parent.handler?.handlePageChange(newPage: self.parent.currentIndex)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                 return nil
             }
            
            if index == 0 {
                return nil
            }
            
            return parent.viewControllers[index - 1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.viewControllers.count {
                return nil
            }
            return parent.viewControllers[index + 1]
        }
        
        init(_ pageViewControler: PWSwipeView) {
            self.parent = pageViewControler
        }
    }
    
    
}

protocol PWSwipeViewHandler {
    func handlePageChange(newPage: Int)
}

