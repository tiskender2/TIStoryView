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
![example](https://github.com/tiskender2/TIStoryView/assets/17899883/27f98308-8c33-4b82-b684-9f267af9ce56)

Here's an example of how you can use `TIStoryView` in your SwiftUI view:

```swift
import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false![13c5a9a1-e19c-4f4f-8bbf-58841e4eb083](https://github.com/tiskender2/TIStoryView/assets/17899883/f20128a2-9bc9-4fdf-9ead-48590efdbd1d)


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
```

## Requirements
iOS 15.0+
