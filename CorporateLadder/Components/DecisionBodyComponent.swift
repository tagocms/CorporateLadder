//
//  DecisionBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct DecisionBodyComponent: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        DecisionTextComponent(decision: viewModel.decision)
        
        Spacer()
        
        HStack(alignment: .center) {
            Spacer()
            ForEach(viewModel.decision.choices) { choice in
                Button(choice.title) {
                    viewModel.stressTotal += choice.stressValue
                    viewModel.successTotal += choice.successValue
                    
                    if viewModel.month != .march {
                        viewModel.month = viewModel.month.next()
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    DecisionBodyComponent(viewModel: $viewModel)
}
