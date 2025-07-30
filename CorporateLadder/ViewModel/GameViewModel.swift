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
    
    var selectedChoices = [Choice]()
    
    var affliction: String {
        switch stressTotal {
        case ..<0:
            return "You feel as if you wasted a whole year doing nothing and feel no purpose in life anymore."
        case 0..<10:
            return "Fortunately, you were not afflicted with any mental illness during this year!"
        case 10..<20:
            return "Unfortunately, you developed anxiety disorder as a response to the constant pressure you were put under, because of the \(stressTotal) stress points you accumulated."
        case 20..<40:
            return "To cope with the \(stressTotal) stress points you accumulated, you developed an addiction to substances."
        case 40..<60:
            return "As a result of having to be extremely attentive to detail and accumulating \(stressTotal) stress points, you developed severe Obsessive-Compulsive Disorder."
        case 60..<80:
            return "After this roller coaster of a year, you are afflicted with panic attacks frequently, and are unable to leave the house without being afraid because of the \(stressTotal) stress points you accumulated."
        case 80..<100:
            return "You don't feel like leaving your room, eating or even talking to anyone else... the \(stressTotal) stress points really left a mark on you..."
        case 100...:
            return "You have a total of \(stressTotal) stress points, which made you reach a terrifying burnout that forced you to quit your job..."
        default:
            return "You feel as if you wasted a whole year doing nothing and feel no purpose in life anymore."
        }
    }
    
    var ending: String {
        let description = goalChoice == .expert ? "an expert in your field" : "a manager"
        
        switch successTotal {
        case ..<100:
            return "Unfortunately, with \(successTotal) success points, you did not achieve your goal of becoming \(description)."
        case 100..<200:
            if goalChoice == .expert {
                return "With \(successTotal) success points, you achieved your goal of becoming \(description)!"
            } else {
                return "Unfortunately, with \(successTotal) success points, you did not achieve your goal of becoming \(description)."
            }
        case 200...:
            return "With \(successTotal) success points, you achieved your goal of becoming \(description)!"
        default:
            return "Unfortunately, with \(successTotal) success points, you did not achieve your goal of becoming \(description)."
        }
    }
    
    func handlePrologueChoice(_ choice: Choice) {
        goalChoice = choice.goalChoice!
        month = .january
        gameState = .beggining
    }
    
    func handleChoice(_ choice: Choice) {
        selectedChoices.append(choice)
        
        stressTotal += choice.stressValue
        successTotal += choice.successValue
        
        // Treating user choices, to make sure future choices are affected as well
        switch choice.tag {
        case .standard:
            break
        case .project:
            <#code#>
        case .course:
            <#code#>
        case .coworker:
            <#code#>
        case .delegate:
            <#code#>
        }
    }
    
    func stressCheck() {
        if stressTotal >= stressMax {
            gameState = .lost
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
