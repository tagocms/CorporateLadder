//
//  Choice.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import Foundation

class Choice: Identifiable {
    var id: UUID
    var title: String
    var subtitle: String
    // Talvez adicionar isso como função de estresse
    var stressValue: Int
    var successValue: Int
    var goalChoice: GoalChoice?
    
    init(id: UUID = UUID(), title: String, subtitle: String, stressValue: Int, successValue: Int, goalChoice: GoalChoice? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.stressValue = stressValue
        self.successValue = successValue
        self.goalChoice = goalChoice
    }
}

enum GoalChoice: String, CaseIterable {
    case expert = "Expert"
    case manager = "Manager"
    case standard = "Standard"
    
    var goalValue: Int {
        switch self {
        case .expert:
            return 100
        case .manager:
            return 200
        default:
            return 0
        }
    }
}
