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
        VStack(alignment: .center, spacing: 30) {
            CLDecisionTextComponent(decision: viewModel.prologue, color: viewModel.feelingColor)
            
            CLDocumentComponent(colorIdle: "LightGrey", colorSelected: "LightBlue", choices: viewModel.prologue.choices, isPrologue: true) {
                viewModel.handlePrologueChoice($0)
            } actionRight: {
                viewModel.handlePrologueChoice($0)
            }
            
            VStack(alignment: .leading) {
                Text("Swipe the document to the").robotoBody()
                + Text(" left ").robotoBodySemibold()
                + Text("to set your goal to be an").robotoBody()
                + Text(" Expert").robotoBodySemibold()
                + Text(".").robotoBody()
                
                Text("\nSwipe the document to the").robotoBody()
                + Text(" right ").robotoBodySemibold()
                + Text("to set your goal to be a").robotoBody()
                + Text(" Manager").robotoBodySemibold()
                + Text(".").robotoBody()
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    
    CLPrologueBodyComponent(viewModel: $viewModel)
}
