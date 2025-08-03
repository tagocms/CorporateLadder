//
//  CLDocumentComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 02/08/25.
//

import SwiftUI

struct CLDocumentDraggableComponent: View {
    let colorIdle: String
    let colorSelected: String
    let choices: [Choice]
    let isPrologue: Bool
    let action: (Choice) -> Void
    let timer = Timer.publish(every: 0.6, on: .main, in: .common).autoconnect()
    
    @State private var color: String
    @State private var offset = CGSize.zero
    @State private var choiceText = ""
    @State private var choiceValues = ""
    @State private var isScaled = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .leading) {
                Image("document\(color)")
                    .resizable()
                    .scaledToFit()
                
                if offset.width != .zero {
                    VStack(alignment: .leading) {
                        Text(choiceText)
                            .robotoBodySemibold()
                        if !isPrologue {
                            Text(choiceValues)
                                .robotoBody()
                        }
                    }
                    .padding(10)
                    .foregroundStyle(color != "LightGrey" ? .white : .black)
                    .transition(.identity)
                }
                
            }
            
            if offset.width != .zero {
                Image(color != "Black" ? "Stamp" : "StampWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .transition(.identity)
            }
        }
        .frame(width: 200)
        .scaleEffect(isScaled ? 1.1 : 1)
        .offset(x: offset.width * 2)
        .rotationEffect(.degrees(offset.width / 10.0))
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation {
                        isScaled = false
                    }
                    color = colorSelected
                    
                    let width = value.translation.width
                    // Fix animation later
                    withAnimation {
                        offset = value.translation
                    }
                    
                    withAnimation(nil) {
                        if width < -1 {
                            choiceText = "\(choices[0].title)"
                            choiceValues = "\(choices[0].stressValue >= 0 ? "+": "")\(choices[0].stressValue) Stress\n\(choices[0].successValue >= 0 ? "+": "")\(choices[0].successValue) Success"
                        } else if width > 1 {
                            choiceText = "\(choices[1].title)"
                            choiceValues = "\(choices[1].stressValue >= 0 ? "+": "")\(choices[1].stressValue) Stress\n\(choices[1].successValue >= 0 ? "+": "")\(choices[1].successValue) Success"
                        }
                    }
                }
                .onEnded { value in
                    color = colorIdle
                    let width = value.translation.width
                    
                    if width < -100 {
                        action(choices[0])
                        HapticsManager.shared.play(.success)
                        SoundManager.instance.playSound(name: "stamp")
                    } else if width > 100 {
                        action(choices[1])
                        HapticsManager.shared.play(.success)
                        SoundManager.instance.playSound(name: "stamp")
                    } else {
                        withAnimation() {
                            offset = CGSize.zero
                        }
                        choiceText = ""
                        choiceValues = ""
                        HapticsManager.shared.play(.warning)
                    }
                }
        )
        .onReceive(timer) { _ in
            if offset == .zero {
                withAnimation {
                    isScaled.toggle()
                }
            }
        }
    }
    
    init(colorIdle: String, colorSelected: String, choices: [Choice], isPrologue: Bool, action: @escaping (Choice) -> Void) {
        // Validate if the number of choices are equal to 2
        guard choices.count == 2 else {
            fatalError("Not enough choices.")
        }
        
        self.colorIdle = colorIdle
        self.colorSelected = colorSelected
        self.choices = choices
        self.isPrologue = isPrologue
        self.action = action
        
        _color = State(initialValue: colorIdle)
    }
}

#Preview {
    CLDocumentDraggableComponent(colorIdle: "LightGrey", colorSelected:  "Black", choices: Decision.createDecisions()[0].choices, isPrologue: false, action: { _ in })
}
