//
//  GameLostView.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import SwiftUI

struct GameLostView: View {
    let stressTotal: Int
    let successTotal: Int
    let goalChoice: GoalChoice
    let month: Month
    
    var body: some View {
        Text("Game Lost!")
    }
}

#Preview {
    GameLostView(stressTotal: 90, successTotal: 200, goalChoice: .manager, month: .october)
}
