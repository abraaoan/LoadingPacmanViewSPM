//
//  InfiniteScroller.swift
//  LoadingPacmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct InfiniteScroller<Content: View>: View {
    var contentWidth: CGFloat
    var content: (() -> Content)
    @State var xOffset: CGFloat = 0

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                content()
            }
            .offset(x: xOffset, y: 0)
        }
        .disabled(true)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                xOffset = -contentWidth
            }
        }
    }
}
