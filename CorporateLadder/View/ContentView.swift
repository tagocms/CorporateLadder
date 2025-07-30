//
//  ContentView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var gameState = GameState.prologue
    @State private var month = Month.prologue
    @State private var stressTotal = 0
    @State private var successTotal = 0
    @State private var goalChoice = GoalChoice.standard
    
    var body: some View {
        switch gameState {
        case .prologue:
            GamePrologueView(gameState: $gameState, goalChoice: $goalChoice, month: $month)
        case .beggining:
            GameBegginingView(gameState: $gameState)
        case .playing:
            GamePlayingView(goalChoice: goalChoice, gameState: $gameState, month: $month, stressTotal: $stressTotal, successTotal: $successTotal)
        case .finished:
            GameFinishedView(stressTotal: stressTotal, successTotal: successTotal, goalChoice: goalChoice)
        case .lost:
            GameLostView(stressTotal: stressTotal, successTotal: successTotal, goalChoice: goalChoice, month: month)
        }
    }
}

#Preview {
    ContentView()
}
