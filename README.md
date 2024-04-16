# TIStoryView

`TIStoryView` is a SwiftUI view that displays an image with a circular progress loader. It supports customization of the loader's appearance, such as gradient colors and dash pattern.

## Features

- Display an image with a circular progress loader
- Customize the loader's appearance with gradient colors and dash pattern
- Tap gesture support with a callback action

## Installation

Use **Swift Package Manager**

```swift
dependencies: [
    .package(url: "https://github.com/tiskender2/TIStoryView.git", exact: "1.0")
]
```

## Usage

To use `TIStoryView` in your SwiftUI project, follow these steps:

1. **Add the `TIStoryView.swift` file to your project**.
2. Create an instance of `TIStoryView` in your SwiftUI view hierarchy and pass the necessary parameters, such as the image URL, gradient colors, and tap action.

    ```swift
    TIStoryView(
        url: URL(string: "https://example.com/image.jpg"),
        gradient: Gradient(colors: [.orange, .red]),
        isAnimating: $isAnimating,
        tapAction: {
            print("Tapped!")
        }
    )
    ```

4. Customize the appearance of the loader by modifying the `gradient` and `dash` properties in the initializer.

## Example
![example](https://github.com/tiskender2/TIStoryView/assets/17899883/f4ba3db9-6354-43b8-8e32-acabec6a4aa2)


Here's an example of how you can use `TIStoryView` in your SwiftUI view:

```swift
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
        .frame(width: 64, height: 64)
    }
}
```

## Requirements
iOS 15.0+
