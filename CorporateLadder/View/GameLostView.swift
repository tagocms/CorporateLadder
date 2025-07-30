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
        VStack(spacing: 12) {
            Text("Game Lost!")
                .font(.largeTitle)
            
            VStack {
                Text("You have a total of \(viewModel.stressTotal) stress points, reaching a terrifying burnout that forced you to quit your job...")
                Text("You almost made it to \(viewModel.goalChoice.rawValue) - with a total of \(viewModel.successTotal) success points -, but your stress got the best of you.")
            }
            
            Text("Do you want to play again?")
            
            Button("Restart", action: viewModel.resetGame)
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    GameLostView(viewModel: GameViewModel())
}
