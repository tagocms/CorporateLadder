//
//  GameBegginingView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameBegginingView: View {
    @Binding var gameState: GameState
    var body: some View {
        VStack(alignment: .leading) {
            Text("Start of the year")
                .font(.largeTitle)
            Text("As the year starts, you know what you have to do to achieve your goals. But, are you prepared to make those choices?")
                .font(.body)
        }
        .padding()
        
        Button("Start Game") {
            gameState = .playing
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var gameState = GameState.beggining
    GameBegginingView(gameState: $gameState)
}
