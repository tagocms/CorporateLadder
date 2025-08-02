//
//  DecisionBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct CLDecisionBodyComponent: View {
    @Binding var viewModel: GameViewModel
    @State private var selectedChoice: Choice? = nil
    
    var body: some View {
        // Come back to this later to add this logic inside GameViewModel
        if let selectedChoice {
            VStack(alignment: .leading) {
                Text(selectedChoice.title)
                    .font(.largeTitle)
                Text(selectedChoice.subtitle)
                    .font(.body)
                
                if viewModel.month == .december {
                    Button("End game") {
                        self.selectedChoice = nil
                        viewModel.gameState = .ending
                    }
                    
                } else {
                    Button("Next month") {
                        self.selectedChoice = nil
                        viewModel.month = viewModel.month.next()
                    }
                }
            }
        } else {
            if viewModel.month == .prologue {
                CLPrologueBodyComponent(viewModel: $viewModel)
            } else {
                VStack(alignment: .center) {
                    CLDecisionTextComponent(decision: viewModel.decision, color: viewModel.feelingColor)
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 30) {
                        CLStressBarComponent(color: viewModel.feelingColor, currentValue: viewModel.stressTotal)
                        
                        CLDocumentComponent(colorIdle: "LightGrey", colorSelected: viewModel.feelingColorImage, choices: viewModel.decision.choices, isPrologue: false) { choice in
                            viewModel.handleChoice(choice)
                            selectedChoice = choice
                        } actionRight: { choice in
                            viewModel.handleChoice(choice)
                            selectedChoice = choice
                        }
                        
                        CLSuccessBarComponent(color: viewModel.feelingColor, maxValue: viewModel.goalChoice.goalValue, currentValue: viewModel.successTotal)
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.clDarkGrey)
                    )
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    viewModel.month = .january
    viewModel.goalChoice = .manager
    viewModel.successTotal = 90
    viewModel.stressTotal = 90
    
    return CLDecisionBodyComponent(viewModel: $viewModel)
}
