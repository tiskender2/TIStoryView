TIStoryView
TIStoryView is a SwiftUI view that displays an image with a circular progress loader. It supports customization of the loader's appearance, such as gradient colors and dash pattern.

Features
Display an image with a circular progress loader
Customize the loader's appearance with gradient colors and dash pattern
Tap gesture support with a callback action
Usage
To use TIStoryView in your SwiftUI project, follow these steps:

Add the TIStoryView.swift file to your project.
Create an instance of TIStoryView in your SwiftUI view hierarchy and pass the necessary parameters, such as the image URL, gradient colors, and tap action.
swift
Copy code
TIStoryView(
    url: URL(string: "https://example.com/image.jpg"),
    gradient: Gradient(colors: [.orange, .red]),
    isAnimating: $isAnimating,
    tapAction: {
        print("Tapped!")
    }
)
Use the isAnimating binding to control the loader animation. When isAnimating is set to true, the loader will animate. You can change the value of isAnimating to start or stop the animation.
swift
Copy code
@State private var isAnimating = false
Customize the appearance of the loader by modifying the gradient and dash properties in the initializer.
Example
Here's an example of how you can use TIStoryView in your SwiftUI view:

swift
Copy code
import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false

    var body: some View {
        TIStoryView(
            url: URL(string: "https://example.com/image.jpg"),
            gradient: Gradient(colors: [.orange, .red]),
            isAnimating: $isAnimating,
            tapAction: {
                print("Tapped!")
            }
        )
        .frame(width: 200, height: 200)
    }
}
Requirements
iOS 15.0+
Feel free to customize the README further to include additional details or instructions specific to your project.
