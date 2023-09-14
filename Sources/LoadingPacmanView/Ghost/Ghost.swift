//
//  Ghost.swift
//  LoadingPacmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct Ghost: View {
    let eyeOffset: CGFloat
    let legsOffset: Double
    let name: GhostName
    private let crazyColor = Color(red: 243/255, green: 192/255, blue: 156/255)
    
    init(name: GhostName,
         eyeOffset: CGFloat = 0.5,
         legsOffset: Double = 4) {
        self.name = name
        self.eyeOffset = eyeOffset
        self.legsOffset = legsOffset
    }
    
    var body: some View {
        ZStack {
            GhostBody(legsOffset: legsOffset,
                      color: name.color())

            GeometryReader { geometry in
                let x = geometry.size.width / 3
                
                GhostEye(eyeOffset: eyeOffset, color: name == .crazyBlue ? crazyColor : .white)
                    .position(CGPoint(x: x, y: geometry.size.height))
                GhostEye(eyeOffset: eyeOffset, color: name == .crazyBlue ? crazyColor : .white)
                    .position(CGPoint(x: geometry.size.width - x, y: geometry.size.height))
            }
        }
    }
}

struct Ghost_Previews: PreviewProvider {
    static var previews: some View {
        Ghost(name: .crazyBlue)
    }
}
