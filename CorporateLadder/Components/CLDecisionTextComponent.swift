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
        ZStack {
            Color.white
            
            VStack(alignment: .leading) {
                Text(decision.title.rawValue)
                    .poppinsLargeTitle()
                    .foregroundStyle(color)
                
                Text(decision.subtitle)
                    .robotoBody()
                +
                Text(" \(decision.callToAction)")
                    .robotoBodySemibold()
            }
        }
    }
}

#Preview {
    CLDecisionTextComponent(decision: Decision.createDecisions()[0], color: .clLightBlue)
}
