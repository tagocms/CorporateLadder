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
    
    var decisions = Decision.createDecisions()
    var prologue = Decision.createPrologue()
    
    var decision: Decision {
        let decision = decisions.first(where: {$0.title == month})
        
        if let decision {
            return decision
        } else {
            fatalError("Data was not found.")
        }
    }
    
    var selectedChoices = [Choice]()
    
    var feelingColor: Color {
        switch stressTotal {
        case ..<0:
            return .clLightBlue
        case 0..<30:
            return .clLightBlue
        case 30..<60:
            return .clOrange
        case 60..<90:
            return .clDarkOrange
        case 90...:
            return .black
        default:
            return .clLightBlue
        }
    }
    
    var feelingColorImage: String {
        switch stressTotal {
        case ..<0:
            return "LightBlue"
        case 0..<30:
            return "LightBlue"
        case 30..<60:
            return "Orange"
        case 60..<90:
            return "DarkOrange"
        case 90...:
            return "Black"
        default:
            return "LightBlue"
        }
    }
    
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
            let decision = decisions[2] // March
            let choiceAffected = decision.choices[0]
            choiceAffected.stressValue = 20
            choiceAffected.successValue = 30
            decision.choices.remove(at: 1)
            
            decision.choices.append(Choice(title: "Focus on finishing the project you pitched in January", subtitle: "You talk to your manager and are able to delegate your other tasks to your colleagues. You manage to finish and present your project to a room full of executives.", stressValue: 10, successValue: 20))
        case .course:
            let decision = decisions[5] // June
            decision.subtitle = "This is it. The final weeks until the HR Course you applied to on April. But, if you are to get accepted, you must work harder in order to be the high-performing employee HR is looking for."
            
            decision.choices.removeAll()
            decision.choices.append(contentsOf: [Choice(title: "Push yourself to get accepted in the course and take it", subtitle: "You did it! You earned the high-performing stamp on your resume. Also, you got to take the course and ended up learning a lot of leadership skills. The problem is that this push for performance took a toll on you...", stressValue: 25, successValue: 40),
            Choice(title: "Give up on the course", subtitle: "Frustrated, you give up on getting accepted into the course and do your regular work, as usual... but the feeling that you could have done more doesn't leave you...", stressValue: 10, successValue: 10)])
        case .coworker:
            let decision = decisions[8] // September
            
            decision.choices.removeAll()
            decision.choices.append(contentsOf: [Choice(title: "Accept responsability for the mistake and help her correct it", subtitle: "You and your coworker, together, correct the problem and report it to your boss. He's satisfied, and tells you to be more perceptive next time.", stressValue: 20, successValue: 25),
            Choice(title: "Pin the mistake on your new coworker", subtitle: "You tell your boss that the mistake happened and it was your coworker's fault, and he tells her to fix it by herself.", stressValue: 10, successValue: 10)])
            
            let otherAffectedDecision = decisions[9] // October
            otherAffectedDecision.choices[1].subtitle = "You call your new coworker to help you on this project, which might be wise, considering the amount of work you already have to deal with and the fact that you two have already worked closely together before."
            
        case .delegate:
            let novemberDecision = decisions[10]
            novemberDecision.choices[0].stressValue = 15
            novemberDecision.choices[1].stressValue = 0
            
            let decemberDecision = decisions[11]
            decemberDecision.choices[0].successValue = -10
            decemberDecision.choices[1].stressValue = 30
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
        decisions = Decision.createDecisions()
        prologue = Decision.createPrologue()
    }
}
