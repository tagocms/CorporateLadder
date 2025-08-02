//
//  GamePrologueView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GamePrologueView: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            CLPrologueBodyComponent(viewModel: $viewModel)
            
            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    @Previewable @State var viewModel = GameViewModel()
    GamePrologueView(viewModel: $viewModel)
}
