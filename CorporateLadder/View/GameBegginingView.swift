//
//  GameBegginingView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameBegginingView: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Start of the year")
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 4) {
                Text("As the year begins, you know what you have to do to achieve your goals. But, are you prepared to make those choices?")
                Text("You have 12 months to perform the best you can, and each of the choices you make can add to your stress points and/or success points.")
                Text("Your goal is to reach the \(viewModel.goalChoice.rawValue) position, and that requires a total of \(viewModel.goalChoice.goalValue) success points.")
                Text("You also have to limit your stress level, so you don't exceed \(viewModel.stressMax) stress points.")
            }
            .font(.body)
        }
        .padding()
        
        VStack {
            Text("All set?")
            Button("Start Game") {
                viewModel.gameState = .playing
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    GameBegginingView(viewModel: $viewModel)
}
