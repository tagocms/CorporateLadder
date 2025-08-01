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
            EmptyView()
        case .prologue:
            GamePrologueView(viewModel: $viewModel)
        case .beggining:
            GameBegginingView(viewModel: $viewModel)
        case .playing:
            GamePlayingView(viewModel: $viewModel)
        case .ending:
            GameFinishedView(viewModel: viewModel)
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
