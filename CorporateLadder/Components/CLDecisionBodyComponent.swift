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
                if viewModel.month == .prologue {
                    CLHeaderTextComponent(title: viewModel.month.rawValue, subtitle: "As the year begins, you know what you have to do to achieve your goals. But, are you prepared to make those choices?\n\nYou have 12 months to perform the best you can, and each of the choices you make can add to your stress points and/or success points.\n\nYour goal is to reach the \(viewModel.goalChoice.rawValue) position, and that requires a total of \(viewModel.goalChoice.goalValue) success points.\n\nYou also have to limit your stress level, so you don't exceed \(viewModel.stressMax) stress points.", callToAction: "", color: viewModel.feelingColor)
                } else {
                    CLHeaderTextComponent(title: viewModel.month.rawValue, subtitle: selectedChoice.subtitle, callToAction: "", color: viewModel.feelingColor)
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 30) {
                    CLStressBarComponent(color: viewModel.feelingColor, currentValue: viewModel.stressTotal)
                    
                    if viewModel.month == .december {
                        CLDocumentButtonComponent(color: viewModel.feelingColorImage, text: "Tap to end game...") {
                            withAnimation() {
                                self.selectedChoice = nil
                                viewModel.gameState = .ending
                            }
                        }
                    } else {
                        CLDocumentButtonComponent(color: viewModel.feelingColorImage, text: "Tap to move on...") {
                            withAnimation() {
                                self.selectedChoice = nil
                                viewModel.month = viewModel.month.next()
                            }
                        }
                    }
                    
                    CLSuccessBarComponent(color: viewModel.feelingColor, maxValue: viewModel.goalChoice.goalValue, currentValue: viewModel.successTotal)
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.clDarkGrey)
                )
            }
            .transition(.scale)
        } else {
            Group {
                if viewModel.month == .prologue {
                    VStack(alignment: .center, spacing: 30) {
                        CLHeaderTextComponent(decision: viewModel.prologue, color: viewModel.feelingColor)
                        
                        CLDocumentDraggableComponent(colorIdle: "LightGrey", colorSelected: "LightBlue", choices: viewModel.prologue.choices, isPrologue: true) { choice in
                            withAnimation(nil) {
                                viewModel.handlePrologueChoice(choice)
                                selectedChoice = choice
                            }
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
                        
                        Spacer()
                    }
                } else {
                    VStack(alignment: .leading) {
                        CLHeaderTextComponent(decision: viewModel.decision, color: viewModel.feelingColor)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 30) {
                            CLStressBarComponent(color: viewModel.feelingColor, currentValue: viewModel.stressTotal)
                            
                            CLDocumentDraggableComponent(colorIdle: "LightGrey", colorSelected: viewModel.feelingColorImage, choices: viewModel.decision.choices, isPrologue: false) { choice in
                                withAnimation(nil) {
                                    viewModel.handleChoice(choice)
                                    selectedChoice = choice
                                }
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
            .transition(.scale)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    viewModel.month = .prologue
    viewModel.successTotal = 0
    viewModel.stressTotal = 0
    
    return CLDecisionBodyComponent(viewModel: $viewModel)
}
