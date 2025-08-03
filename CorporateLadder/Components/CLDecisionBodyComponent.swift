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
                    CLHeaderTextComponent(isPrologue: true, color: viewModel.feelingColor, goalChoice: viewModel.goalChoice)
                } else {
                    CLHeaderTextComponent(title: viewModel.month.rawValue, subtitle: selectedChoice.subtitle, callToAction: "", color: viewModel.feelingColor)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    CLStressBarComponent(color: viewModel.feelingColor, currentValue: viewModel.stressTotal)
                    Spacer()
                    if viewModel.month == .december {
                        CLButtonComponent(text: "End game...", color: viewModel.feelingColor, style: .primary) {
                            withAnimation() {
                                self.selectedChoice = nil
                                viewModel.gameState = .ending
                            }
                        }
                    } else {
                        CLButtonComponent(text: "Move on...", color: viewModel.feelingColor, style: .primary) {
                            withAnimation() {
                                self.selectedChoice = nil
                                viewModel.month = viewModel.month.next()
                            }
                        }
                    }
                    Spacer()
                    CLSuccessBarComponent(color: viewModel.feelingColor, maxValue: viewModel.goalChoice.goalValue, currentValue: viewModel.successTotal)
                }
                .frame(height: UIScreen.main.bounds.height * 0.55)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.clDarkGrey)
                )
            }
            .transition(.blurReplace)
        } else {
            Group {
                if viewModel.month == .prologue {
                    VStack(alignment: .center) {
                        CLHeaderTextComponent(decision: viewModel.prologue, color: viewModel.feelingColor)
                        
                        Spacer()
                        
                        VStack(spacing: 30) {
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
                            .foregroundStyle(.black)
                            .shadow(color: viewModel.feelingColor, radius: 10)
                        }
                        .frame(height: UIScreen.main.bounds.height * 0.55)
                        
                        Spacer()
                    }
                } else {
                    VStack(alignment: .leading) {
                        CLHeaderTextComponent(decision: viewModel.decision, color: viewModel.feelingColor)
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            CLStressBarComponent(color: viewModel.feelingColor, currentValue: viewModel.stressTotal)
                            Spacer()
                            CLDocumentDraggableComponent(colorIdle: "LightGrey", colorSelected: viewModel.feelingColorImage, choices: viewModel.decision.choices, isPrologue: false) { choice in
                                withAnimation(nil) {
                                    viewModel.handleChoice(choice)
                                    selectedChoice = choice
                                }
                            }
                            Spacer()
                            CLSuccessBarComponent(color: viewModel.feelingColor, maxValue: viewModel.goalChoice.goalValue, currentValue: viewModel.successTotal)
                        }
                        .frame(height: UIScreen.main.bounds.height * 0.55)
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
