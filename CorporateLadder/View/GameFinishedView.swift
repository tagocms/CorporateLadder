//
//  GameFinishedView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameFinishedView: View {
    var viewModel: GameViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Game Finished!")
                .font(.largeTitle)
            
            Text(viewModel.ending)
                .font(.title3)
            
            Text(viewModel.affliction)
                .font(.title3)
            
            Text("Do you want to play again?")
            
            Button("Restart", action: viewModel.resetGame)
        }
        .padding()
    }
}

#Preview {
    GameFinishedView(viewModel: GameViewModel())
}
