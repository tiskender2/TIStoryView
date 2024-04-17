//
//  SwiftUIView.swift
//  
//
//  Created by Tolga İskender on 17.04.2024.
//

import SwiftUI

struct CachedAsyncImage: View {
    @ObservedObject var imageLoader: ImageLoader

    init(url: URL?) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}
