//
//  GameFinishedView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameFinishedView: View {
    let stressTotal: Int
    let successTotal: Int
    let goalChoice: GoalChoice
    
    var body: some View {
        Text("Game Finished!")
    }
}

#Preview {
    GameFinishedView(stressTotal: 90, successTotal: 200, goalChoice: .manager)
}
