//
//  GhostBackgroundEye.swift
//  LoadingPacmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct GhostBackgroundEye: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let size = rect.width / 10
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: size,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: true)
        }
    }
}
