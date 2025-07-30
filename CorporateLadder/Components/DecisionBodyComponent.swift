//
//  DecisionBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct DecisionBodyComponent: View {
    let decision: Decision
    @Binding var month: Month
    @Binding var stressTotal: Int
    @Binding var successTotal: Int
    
    var body: some View {
        DecisionTextComponent(decision: decision)
        
        Spacer()
        
        HStack(alignment: .center) {
            Spacer()
            ForEach(decision.choices) { choice in
                Button(choice.title) {
                    stressTotal += choice.stressValue
                    successTotal += choice.successValue
                    
                    if month != .march {
                        month = month.next()
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var month = Month.january
    @Previewable @State var stressTotal = 0
    @Previewable @State var successTotal = 0
    DecisionBodyComponent(decision: Decision.createDecisions()[0], month: $month, stressTotal: $stressTotal, successTotal: $successTotal)
}
