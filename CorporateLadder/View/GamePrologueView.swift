//
//  GamePrologueView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GamePrologueView: View {
    let prologue = Decision.createPrologue()
    @Binding var gameState: GameState
    @Binding var goalChoice: GoalChoice
    @Binding var month: Month
    
    var body: some View {
        PrologueBodyComponent(decision: prologue, gameState: $gameState, goalChoice: $goalChoice, month: $month)
        
        Spacer()
    }
}

#Preview {
    @Previewable @State var gameState = GameState.prologue
    @Previewable @State var goalChoice = GoalChoice.standard
    @Previewable @State var month = Month.prologue
    GamePrologueView(gameState: $gameState, goalChoice: $goalChoice, month: $month)
}
