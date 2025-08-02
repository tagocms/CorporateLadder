//
//  DecisionTextComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct CLDecisionTextComponent: View {
    let decision: Decision
    let color: Color
    
    var body: some View {
            VStack(alignment: .leading, spacing: 30) {
                Text(decision.title.rawValue)
                    .poppinsLargeTitle()
                    .foregroundStyle(color)
                
                ScrollView {
                    Text(decision.subtitle)
                        .robotoBody()
                    +
                    Text(" \(decision.callToAction)")
                        .robotoBodySemibold()
                }
                .frame(height: UIScreen.main.bounds.height * 0.15)
                .scrollBounceBehavior(.basedOnSize)
            }
    }
}

#Preview {
    CLDecisionTextComponent(decision: Decision.createDecisions()[0], color: .clLightBlue)
}
