//
//  ContentView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GamePlayingView: View {
    private let decisions = Decision.createDecisions()
    private let stressMax = 100
    
    let goalChoice: GoalChoice
    
    @Binding var gameState: GameState
    
    @Binding var month: Month
    @Binding var stressTotal: Int
    @Binding var successTotal: Int
    
    private var decision: Decision {
        let decision = decisions.first(where: {$0.title == month})
        
        if let decision {
            return decision
        } else {
            fatalError("Data was not found.")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Success Goal: \(goalChoice.goalValue)")
                    .font(.subheadline)
                Spacer()
                Text("Stress: \(stressTotal)")
                    .font(.subheadline)
                Spacer()
                Text("Success: \(successTotal)")
                    .font(.subheadline)
            }
            
            DecisionBodyComponent(decision: decision, month: $month, stressTotal: $stressTotal, successTotal: $successTotal)
            
            Spacer()
            
        }
        .padding()
        .onChange(of: stressTotal) {
            if stressTotal >= stressMax {
                gameState = .lost
            }
        }
    }
}

#Preview {
    @Previewable @State var gameState = GameState.playing
    @Previewable @State var month = Month.january
    @Previewable @State var stressTotal = 0
    @Previewable @State var successTotal = 0
    let goalChoice = GoalChoice.expert
    
    GamePlayingView(goalChoice: goalChoice, gameState: $gameState, month: $month, stressTotal: $stressTotal, successTotal: $successTotal)
}
