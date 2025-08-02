//
//  GameStartView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 01/08/25.
//

import SwiftUI

struct GameStartView: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Image("Texture")
                .resizable()
                .scaledToFill()
                .opacity(0.2)
            
            VStack(spacing: 30) {
                Spacer()
                
                Image("Logo_WO_Background")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(12)
                
                CLButtonComponent(style: .primary) {
                    withAnimation {
                        viewModel.gameState = .playing
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GameStartView(viewModel: .constant(GameViewModel()))
}
