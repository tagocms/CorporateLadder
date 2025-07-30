//
//  DecisionTextComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct DecisionTextComponent: View {
    let decision: Decision
    
    var body: some View {
        HStack {
            Text(decision.title.rawValue)
                .font(.largeTitle)
            Spacer()
        }

        HStack {
            Text(decision.subtitle)
                .font(.body)
            Spacer()
        }
    }
}

#Preview {
    DecisionTextComponent(decision: Decision.createDecisions()[0])
}
