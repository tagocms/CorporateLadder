//
//  DecisionTextComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct CLHeaderTextComponent: View {
    let title: String
    let subtitle: String
    let callToAction: String
    let color: Color
    let isPrologue: Bool
    var goalChoice: GoalChoice? = nil
    
    var body: some View {
            VStack(alignment: .leading, spacing: 30) {
                Text(title)
                    .poppinsLargeTitle()
                    .foregroundStyle(color)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        if isPrologue {
                            Text("You have 12 months to perform the best you can, and each of the choices you make can add to your stress points and/or success points.\n")
                                .robotoBody()
                            Text("Your goal is to reach the").robotoBody()
                            + Text(" \(goalChoice?.rawValue ?? "Expert") position").robotoBodySemibold()
                            + Text(", and that requires a total of").robotoBody()
                            + Text("\(goalChoice?.goalValue ?? 100) success points").robotoBodySemibold()
                            + Text(".\n")
                            Text("You also have to limit your stress level,").robotoBody()
                            + Text(" so you don't exceed 100 stress points").robotoBodySemibold()
                            + Text(".").robotoBody()
                        } else {
                                Text(subtitle)
                                    .robotoBody()
                                +
                                Text(" \(callToAction)")
                                    .robotoBodySemibold()
                            }
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.15)
                .scrollIndicatorsFlash(onAppear: true)
                .scrollBounceBehavior(.basedOnSize)
            }
    }
    
    init(title: String, subtitle: String, callToAction: String, color: Color) {
        self.title = title
        self.subtitle = subtitle
        self.callToAction = callToAction
        self.color = color
        self.isPrologue = false
    }
    
    init(decision: Decision, color: Color) {
        self.title = decision.title.rawValue
        self.subtitle = decision.subtitle
        self.callToAction = decision.callToAction
        self.color = color
        self.isPrologue = false
    }
    
    init(isPrologue: Bool, color: Color, goalChoice: GoalChoice) {
        if isPrologue {
            self.title = "Prologue"
            self.subtitle = ""
            self.callToAction = ""
            self.color = color
            self.isPrologue = isPrologue
            self.goalChoice = goalChoice
        } else {
            self.title = ""
            self.subtitle = ""
            self.callToAction = ""
            self.color = .clear
            self.isPrologue = isPrologue
        }
    }
}

#Preview {
    CLHeaderTextComponent(decision: Decision.createDecisions()[0], color: .clLightBlue)
}

#Preview {
    CLHeaderTextComponent(isPrologue: true, color: .clLightBlue, goalChoice: .expert)
}
