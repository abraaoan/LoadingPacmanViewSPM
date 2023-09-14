//
//  GhostName.swift
//  LoadingPackmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

enum GhostName: CaseIterable {
    case blinky
    case clyde
    case pinky
    case inky
    case crazyBlue
    
    func color() -> Color {
        switch self {
        case .blinky:
            return .red
        case .clyde:
            return Color(red: 255/255,
                         green: 184/255,
                         blue: 82/255)
        case .pinky:
            return Color(red: 255/255,
                         green: 184/255,
                         blue: 255/255)
        case .inky:
            return Color(red: 0,
                         green: 1.0,
                         blue: 1.0)
        case .crazyBlue:
            return Color(red: 41/255,
                         green: 62/255,
                         blue: 134/255)
        }
    }
}
