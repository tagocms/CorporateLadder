//
//  DecisionBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct DecisionBodyComponent: View {
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
            DecisionTextComponent(decision: viewModel.decision)
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                ForEach(viewModel.decision.choices) { choice in
                    Button(choice.title) {
                        viewModel.handleChoice(choice)
                        selectedChoice = choice
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    viewModel.month = .january
    
    return DecisionBodyComponent(viewModel: $viewModel)
}
