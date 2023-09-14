//
//  GhostEye.swift
//  LoadingPackmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct GhostEye: View {
    let eyeOffset: CGFloat
    let color: Color
    
    init(eyeOffset: CGFloat = 0, color: Color = .white) {
        self.eyeOffset = eyeOffset
        self.color = color
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                GhostBackgroundEye()
                    .fill(color)
                GhostInsideEye()
                    .fill( color == .white ? .black : color)
                    .position(CGPoint(x: (geometry.size.width / 2) + eyeOffset,
                                      y: geometry.size.height / 2))
            }
        }
    }
}

struct GhostEye_Previews: PreviewProvider {
    static var previews: some View {
        GhostEye()
    }
}
