//
//  SwiftUIView.swift
//  
//
//  Created by Abraao Nascimento on 14/09/2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Pacman(offsetAmount: 30)
                .fill(.yellow)
                .aspectRatio(1.5, contentMode: .fit)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
