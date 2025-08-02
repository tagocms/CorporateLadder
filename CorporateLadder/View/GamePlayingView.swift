//
//  ContentView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GamePlayingView: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            CLDecisionBodyComponent(viewModel: $viewModel)
        }
        .padding(24)
        .onChange(of: viewModel.stressTotal) {
            viewModel.stressCheck()
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    viewModel.month = .january
    viewModel.goalChoice = .manager
    
    return GamePlayingView(viewModel: $viewModel)
}
