//
//  Packman.swift
//  LoadingPackmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct Pacman: Shape {
    var offsetAmount: Double
    var isReversed: Bool
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    init(offsetAmount: Double, isReversed: Bool = false) {
        self.offsetAmount = offsetAmount
        self.isReversed = isReversed
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: isReversed ? 180 + offsetAmount : offsetAmount),
                        endAngle: Angle(degrees: isReversed ? -(180 + offsetAmount) : 360 - offsetAmount),
                        clockwise: false)
            path.closeSubpath()
        }
    }
}
