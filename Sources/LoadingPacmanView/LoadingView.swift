//
//  LoadingView.swift
//  LoadingPackmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

public struct LoadingView: View {
    @State private var isAnimation = false
    @State private var offset: CGFloat = 0
    @State private var isReversed = false
    @State private var name = GhostName.blinky
    
    public init() {}
    
    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                TrackView()
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2 - (20)))
            }
            
            GeometryReader { geometry in
                let legOffset = isReversed ? 1.0 : -1.0
                let ghostOffset = !isReversed ? (offset * 0.15) : 0
                let pacmanOffset = isReversed ? (offset * 0.15) : 0
                let distance = isReversed ? 40.0 : 105.0
                
                Ghost(name: isReversed ? .crazyBlue : name,
                      eyeOffset: isReversed ? -1 : 1,
                      legsOffset: isAnimation ? legOffset : 0)
                    .frame(width: 40)
                    .position(CGPoint(x: Constants.initialPosition + offset + ghostOffset,
                                      y: (geometry.size.height / 2) - 28.0))
                
                Pacman(offsetAmount: isAnimation ? 20 : 0, isReversed: isReversed)
                    .fill(Constants.packmanColor)
                    .frame(height: Constants.packManSize)
                    .position(CGPoint(x: Constants.initialPosition + distance + offset + pacmanOffset,
                                      y: geometry.size.height / 2))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .aspectRatio(contentMode: .fit)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.25).repeatForever()) {
                isAnimation.toggle()
            }
            
            animateRace()
        }
    }
    
    func animateRace() {
        let duration = 3.30
        
        withAnimation(Animation.linear(duration: 3.30)) {
            offset = isReversed ? -100 : UIScreen.main.bounds.width + 70
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.05) {
            isReversed.toggle()
            getNextGhost()
            animateRace()
        }
    }
    
    func getNextGhost() {
        let name = GhostName.allCases.randomElement() ?? .blinky
        guard name != .crazyBlue  else {
            getNextGhost()
            return
        }
        
        self.name = name
    }
}

extension LoadingView {
    private enum Constants {
        static let packmanColor = Color(red: 1.0, green: 0.90, blue: 0.21)
        static let packManSize = 50.0
        static let initialPosition = -60.0
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
