//
//  TIStoryView.swift
//  
//
//  Created by Tolga İskender on 15.04.2024.
//

import Foundation
import SwiftUI

public struct TIStoryView: View {
    private var url: URL?
    private var dash: [CGFloat]
    private var gradient: Gradient = .init(
        colors: [
            .orange.opacity(0.5),
            .orange,
            .red.opacity(0.5),
            .red.opacity(0.7),
            .red.opacity(0.8),
            .red
        ]
    )

    @State private var trimStart: CGFloat = .zero
    @State private var trimEnd: CGFloat = 1
    @State private var rotationDegree: Angle = .degrees(.zero)
    @State private var isAnimated: Bool = false
    @Binding private var isAnimating: Bool

    public var tapAction: () -> Void

    public init(
        url: URL?, 
        dash: [CGFloat] = [],
        isAnimating: Binding<Bool>,
        tapAction: @escaping () -> Void
    ) {
        self.url = url
        self.dash = dash
        self._isAnimating = isAnimating
        self.tapAction = tapAction
    }

    public init(
        url: URL?,
        dash: [CGFloat] = [],
        gradient: Gradient,
        isAnimating: Binding<Bool>,
        tapAction: @escaping () -> Void
    ) {
        self.init(url: url, dash: dash, isAnimating: isAnimating, tapAction: tapAction)
        self.gradient = gradient
    }

    public var body: some View {
        GeometryReader { geo in
            ZStack {
                CachedAsyncImage(url: url)
                .frame(width: geo.size.width, height: geo.size.height)
                .clipShape(.circle)
                Circle()
                    .trim(from: trimStart, to: trimEnd)
                    .stroke(
                        LinearGradient(
                            gradient: gradient,
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ),
                        style: .init(lineWidth: 2, lineCap: .round, dash: dash)
                    )
                    .foregroundStyle(.red)
                    .frame(width: geo.size.width + 4, height: geo.size.height + 4)
                    .rotationEffect(rotationDegree)
            }
            .onTapGesture {
                tapAction()
                startLoading()
            }
            .onChange(of: isAnimating) { newValue in
                if isAnimating {
                    animateLoader()
                } else {
                    stopLoading()
                }
            }
        }

    }
}

//MARK:  - Private API

private extension TIStoryView {

    func animateLoader() {
        guard isAnimating else { return }

        withAnimation(
            .linear(duration: 1.5)
        ) {
            let degrees: Double = isAnimated ? .zero : 360
            let trimStart: CGFloat = isAnimated ? .zero : 1
            rotationDegree = .degrees(degrees)
            self.trimStart = trimStart
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isAnimated = !isAnimated
            animateLoader()
        }
    }

    func stopLoading() {
        isAnimating = false
        rotationDegree = .degrees(.zero)
        trimStart = .zero
    }

    func startLoading() {
        if !isAnimating {
            isAnimating = true
            isAnimated = false
        }
    }
}
