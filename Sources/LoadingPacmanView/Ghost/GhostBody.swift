//
//  Body.swift
//  LoadingPacmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct GhostBody: View {
    let legsOffset: Double
    let color: Color
    
    init(legsOffset: Double = 1.0, color: Color = .red) {
        self.legsOffset = legsOffset
        self.color = color
    }
    
    var body: some View {
            GhostBodyShape(legsOffset: legsOffset)
                .fill(color)
                .aspectRatio(1, contentMode: .fit)
    }
}

struct Body_Previews: PreviewProvider {
    static var previews: some View {
        GhostBody()
    }
}
