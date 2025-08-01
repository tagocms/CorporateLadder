//
//  CLButtonComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 01/08/25.
//

import SwiftUI

struct CLButtonComponent: View {
    let style: CLButtonStyle
    let action: () -> Void
    
    var backgroundColor: Color {
        switch style {
        case .primary:
                .clLightBlue
        case .secondary:
                .white
        case .terciary:
                .clear
        }
    }
    
    var foregroundStyle: Color {
        switch style {
        case .primary:
                .white
        case .secondary:
                .clDarkGrey
        case .terciary:
                .clLightBlue
        }
    }
    
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text("Climb the Ladder")
                    .foregroundStyle(foregroundStyle)
                    .robotoTitle3()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(backgroundColor)
            .cornerRadius(16)
        }
    }
}

enum CLButtonStyle {
    case primary, secondary, terciary
}

#Preview {
    CLButtonComponent(style: .primary, action: {})
}
