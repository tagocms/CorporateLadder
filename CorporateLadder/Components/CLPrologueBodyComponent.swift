//
//  PrologueBody.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct CLPrologueBodyComponent: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        CLDecisionTextComponent(decision: viewModel.prologue, color: viewModel.feelingColor)
        
        Spacer()
        
        HStack(alignment: .center) {
            Spacer()
            ForEach(viewModel.prologue.choices) { choice in
                Button(choice.title) {
                    viewModel.handlePrologueChoice(choice)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    
    CLPrologueBodyComponent(viewModel: $viewModel)
}
