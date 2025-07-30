//
//  GameViewModel.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import Foundation
import SwiftUI

@Observable
class GameViewModel {
    var gameState = GameState.prologue
    var month = Month.prologue
    var stressTotal = 0
    var successTotal = 0
    let stressMax = 100
    var goalChoice = GoalChoice.standard
    
    let decisions = Decision.createDecisions()
    let prologue = Decision.createPrologue()
    
    var decision: Decision {
        let decision = decisions.first(where: {$0.title == month})
        
        if let decision {
            return decision
        } else {
            fatalError("Data was not found.")
        }
    }
    
    var affliction: String {
        switch stressTotal {
        case ..<0:
            return "You feel as if you wasted a whole year doing nothing and feel no purpose in life anymore"
        case 0..<10:
            return "No afflictions"
        case 10..<20:
            return "Anxiety"
        case 20..<40:
            return "Addiction to substances"
        case 40..<60:
            return "Severe OCD"
        case 60..<80:
            return "Constant panic attacks"
        case 80..<100:
            return "Severe depression"
        case 100...:
            return "Burnout"
        default:
            return "You feel as if you wasted a whole year doing nothing and feel no purpose in life anymore"
        }
    }
    
    var ending: String {
        switch successTotal {
        case ..<100:
            return "You did not achieve your goal"
        case 100..<200:
            if goalChoice == .expert {
                return "You achieved your goal"
            } else {
                return "You did not achieve your goal"
            }
        case 200...:
            return "You achieved your goal"
        default:
            return "You did not achieve your goal"
        }
    }
    
    func resetGame() {
        gameState = GameState.prologue
        month = Month.prologue
        stressTotal = 0
        successTotal = 0
        goalChoice = GoalChoice.standard
    }
}
