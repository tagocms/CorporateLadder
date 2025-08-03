//
//  CLButtonComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 01/08/25.
//

import SwiftUI

struct CLButtonComponent: View {
    let text: String
    let color: Color
    let style: CLButtonStyle
    let action: () -> Void
    let timer = Timer.publish(every: 0.6, on: .main, in: .common).autoconnect()
    
    var backgroundColor: Color {
        switch style {
        case .primary:
                color
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
    
    @State private var isScaled = false
    
    
    var body: some View {
        Button {
            action()
            HapticsManager.shared.play(.success)
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text(text)
                    .foregroundStyle(foregroundStyle)
                    .robotoTitle3()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(backgroundColor)
            .cornerRadius(16)
            .scaleEffect(isScaled ? 1.1 : 1)
        }
        .onReceive(timer) { _ in
            withAnimation {
                isScaled.toggle()
            }
        }
    }
    
    init(text: String, color: Color = .clLightBlue, style: CLButtonStyle, action: @escaping () -> Void) {
        self.text = text
        self.color = color
        self.style = style
        self.action = action
    }
}

enum CLButtonStyle {
    case primary, secondary, terciary
}

#Preview {
    CLButtonComponent(text: "Climb the Ladder", color: .clLightBlue, style: .primary, action: {})
}
