//
//  ContentView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = GameViewModel()
    
    var body: some View {
        switch viewModel.gameState {
        case .start:
            GameStartView(viewModel: $viewModel)
                .transition(.blurReplace)
        case .playing:
            GamePlayingView(viewModel: $viewModel)
                .transition(.blurReplace)
        case .ending:
            GameFinishedView(viewModel: viewModel)
                .transition(.blurReplace)
        case .lost:
            GameLostView(viewModel: viewModel)
        case .final:
            EmptyView()
        }
    }
}

#Preview {
    ContentView()
}
