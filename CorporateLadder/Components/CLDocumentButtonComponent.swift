//
//  CLDocumentButtonComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 02/08/25.
//

import SwiftUI

struct CLDocumentButtonComponent: View {
    let color: String
    let text: String
    let action: () -> Void
    
    let timer = Timer.publish(every: 0.6, on: .main, in: .common).autoconnect()
    
    @State private var isScaled = false
    
    var body: some View {
        ZStack {
            Image("document\(color)")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(text)
                    .robotoBodySemibold()
            }
            .padding(10)
            .foregroundStyle(color != "LightGrey" ? .white : .black)
            .transition(.identity)
            
        }
        .frame(width: 200)
        .scaleEffect(isScaled ? 1.1 : 1)
        .onReceive(timer) { _ in
            withAnimation {
                isScaled.toggle()
            }
        }
        .onTapGesture {
            action()
            HapticsManager.shared.play(.success)
        }
    }
}

#Preview {
    CLDocumentButtonComponent(color: "LightBlue", text: "Tap to go to the next screen", action: { })
}
