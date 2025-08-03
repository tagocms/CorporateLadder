//
//  GameFinishedView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameFinishedView: View {
    var viewModel: GameViewModel
    
    var checkLostState: Bool {
        if viewModel.stressTotal >= 100 || viewModel.stressTotal < 0 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack() {
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .leading, spacing: 30) {
                    Text(checkLostState ? "Game Over" : "Ending")
                        .poppinsLargeTitle()
                        .foregroundStyle(viewModel.feelingColor)
                    
                    
                    VStack(alignment: .leading) {
                        if checkLostState {
                            Text("You almost made it to **\(viewModel.goalChoice.rawValue)** - with a total of **\(viewModel.successTotal) success points** -, but your\(viewModel.stressTotal < 0 ? " lack of" : "") stress got the best of you.\n")
                                .robotoBody()
                        } else {
                            Text(.init("\(viewModel.ending)\n"))
                                .robotoBody()
                        }
                        
                        Text(.init("\(viewModel.affliction)\n"))
                            .robotoBody()
                    }
                    .foregroundStyle(.black)
                }
                
                CLButtonComponent(text: "Climb the Ladder Again", color: viewModel.feelingColor, style: .primary) {
                    viewModel.resetGame()
                }
                
                Spacer()
                
                if viewModel.stressTotal > 30 {
                    Image("StressIllustration")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("CalmIllustration")
                        .resizable()
                        .scaledToFit()
                }
            }
            .multilineTextAlignment(.leading)
            .padding(24)
        }
    }
}

#Preview {
    let viewModel = GameViewModel()
    viewModel.gameState = .ending
    viewModel.stressTotal = 90
    viewModel.successTotal = 200
    
    return GameFinishedView(viewModel: viewModel)
}
