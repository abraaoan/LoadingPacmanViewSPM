//
//  TrackView.swift
//  LoadingPacmanView
//
//  Created by Abraao Nascimento on 13/09/2023.
//

import SwiftUI

struct TrackView: View {
    var body: some View {
        InfiniteScroller(contentWidth: UIScreen.main.bounds.width) {
            HStack(spacing: 10) {
                ForEach(0..<Constants.qtd, id: \.self) { _ in
                    Circle()
                        .fill(Constants.fillColor)
                        .frame(height: Constants.pointHeight)
                }
            }
        }
    }
}

extension TrackView {
    private enum Constants {
        static let fillColor = Color(red: 25 / 255, green: 25 / 255, blue: 166/255)
        static let pointHeight = 4.0
        static let qtd = Int(ceil(UIScreen.main.bounds.size.width / 2.0)) 
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
