//
//  ContentView.swift
//  AnimatedStickyHeader
//
//  Created by Naman Vaishnav on 05/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            Home(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
