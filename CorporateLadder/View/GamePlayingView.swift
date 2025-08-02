//
//  ContentView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GamePlayingView: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Success Goal: \(viewModel.goalChoice.goalValue)")
                    .font(.subheadline)
                Spacer()
                Text("Stress: \(viewModel.stressTotal)")
                    .font(.subheadline)
                Spacer()
                Text("Success: \(viewModel.successTotal)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            CLDecisionBodyComponent(viewModel: $viewModel)
            
            Spacer()
            
        }
        .padding()
        .onChange(of: viewModel.stressTotal) {
            viewModel.stressCheck()
        }
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    viewModel.month = .january
    
    return GamePlayingView(viewModel: $viewModel)
}
