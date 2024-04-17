//
//  SwiftUIView.swift
//  
//
//  Created by Tolga İskender on 17.04.2024.
//

import SwiftUI

struct CachedAsyncImage<Placeholder: View>: View {
    @ObservedObject var imageLoader: ImageLoader

    @ViewBuilder private var placeholder: () -> Placeholder?

    init(
        url: URL?,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        imageLoader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            placeholder()
        }
    }
}
