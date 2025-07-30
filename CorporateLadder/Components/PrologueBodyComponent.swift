//
//  PrologueBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct PrologueBodyComponent: View {
    let decision: Decision
    @Binding var gameState: GameState
    @Binding var goalChoice: GoalChoice
    @Binding var month: Month
    
    var body: some View {
        DecisionTextComponent(decision: decision)
        
        Spacer()
        
        HStack(alignment: .center) {
            Spacer()
            ForEach(decision.choices) { choice in
                Button(choice.title) {
                    goalChoice = choice.goalChoice!
                    month = .january
                    gameState = .beggining
                }
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var month = Month.prologue
    @Previewable @State var gameState = GameState.prologue
    @Previewable @State var goalChoice = GoalChoice.standard
    
    PrologueBodyComponent(decision: Decision.createDecisions()[0], gameState: $gameState, goalChoice: $goalChoice, month: $month)
}
