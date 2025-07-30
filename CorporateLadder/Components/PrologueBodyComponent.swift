//
//  PrologueBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct PrologueBodyComponent: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        DecisionTextComponent(decision: viewModel.prologue)
        
        Spacer()
        
        HStack(alignment: .center) {
            Spacer()
            ForEach(viewModel.prologue.choices) { choice in
                Button(choice.title) {
                    viewModel.goalChoice = choice.goalChoice!
                    viewModel.month = .january
                    viewModel.gameState = .beggining
                }
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    
    PrologueBodyComponent(viewModel: $viewModel)
}
