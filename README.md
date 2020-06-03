# PWSwipeView

### A SwiftUI Library for easily swiping between views.

![Demo Gif](https://raw.githubusercontent.com/Pranav-Wadhwa/PWSwipeView/master/Demo.gif?raw=true)

PWSwipeView is a SwiftUI view that allows you to easily swipe between views, similar to a PageViewController.

## Installation

PWSwipeView can be installed via [CocoaPods](https://cocoapods.org). Add the following line to your Podfile:

    pod 'PWSwipeView'
    
## Usage

    import PWSwipeView
    
    struct ContentView: View {
    
        @State var currentPage = 0
        var viewControllers = [UIViewController]()
        
        init() {
            let subviews = [
                // Create the views you want to be swiped here
            ]
            viewControllers = subviews.map { UIHostingController(rootView: $0) }
        }
        
        var body: some View {
            SwipeView(viewControllers: viewControllers, currentPage: $currentPage, isContinuous: true)
        }
    }
    
If you use PWSwipeView in any of your projects, let me know at hello@pranavwadhwa.com! I'm excited to see this library help SwiftUI developers.
        
## License

PWSwipeView is available under the MIT license. See the LICENSE file for more info.
