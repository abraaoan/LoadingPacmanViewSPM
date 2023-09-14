//
//  GhostBodyShape.swift
//  LoadingPacmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct GhostBodyShape: Shape {
    var legsOffset: Double
    var animatableData: Double {
        get { legsOffset }
        set { legsOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let spacing = rect.width / 100
            let headSize = (rect.width - (spacing * 2)) / 2
            let legHeight = rect.width / 6
            let height = (rect.width * 1.2) - headSize
            let qtdTriangles = 3
            let rect = CGRect(x: rect.origin.x + spacing,
                              y: rect.origin.y + headSize / 2 + 10,
                              width: rect.width - (spacing * 2),
                              height: height)
            
            // body
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
            // head
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: headSize,
                        startAngle: Angle(degrees: 180),
                        endAngle: Angle(degrees: 0),
                        clockwise: false)
            
            // legs
            for i in 0..<qtdTriangles {
                let base: CGFloat = rect.width / CGFloat(qtdTriangles)
                let midX: CGFloat = base / 2
                let next: CGFloat = base * CGFloat(i)
                let modifier = 2.0 * legsOffset
                
                path.addLines([
                    CGPoint(x: (rect.maxX - next), y: (rect.maxY)),
                    CGPoint(x: rect.maxX - (midX + next + modifier), y: rect.maxY - legHeight),
                    CGPoint(x: rect.maxX - (base + next), y: rect.maxY),
                ])
            }
        }
    }
}
