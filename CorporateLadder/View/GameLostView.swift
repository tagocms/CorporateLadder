//
//  GameLostView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameLostView: View {
    var viewModel: GameViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Game Lost!")
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(viewModel.affliction)
                Text("You almost made it to \(viewModel.goalChoice.rawValue) - with a total of \(viewModel.successTotal) success points -, but your\(viewModel.stressTotal < 0 ? " lack of" : "") stress got the best of you.")
            }
            
            Text("Do you want to play again?")
            
            Button("Restart", action: viewModel.resetGame)
        }
        .multilineTextAlignment(.leading)
        .padding()
    }
}

#Preview {
    let viewModel = GameViewModel()
    viewModel.stressTotal = 100
    viewModel.goalChoice = .manager
    
    return GameLostView(viewModel: viewModel)
}
