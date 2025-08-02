//
//  CLDocumentComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 02/08/25.
//

import SwiftUI

struct CLDocumentComponent: View {
    let colorIdle: String
    let colorSelected: String
    let choices: [Choice]
    let isPrologue: Bool
    let actionRight: () -> Void
    let actionLeft: () -> Void
    
    @State private var color: String
    @State private var offset = CGSize.zero
    @State private var choiceText = ""
    @State private var choiceValues = ""
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ZStack {
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
                Image("Stamp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .transition(.identity)
            }
        }
        .frame(width: 200)
        .offset(x: offset.width * 5)
        .rotationEffect(.degrees(offset.width / 10.0))
        .gesture(
            DragGesture()
                .onChanged { value in
                    color = colorSelected
                    let width = value.translation.width
                    // Fix anymation later
                    offset = value.translation
                    
                    withAnimation(nil) {
                        if width > 1 {
                            choiceText = "\(choices[0].title)"
                            choiceValues = "+\(choices[0].stressValue) Stress\n+\(choices[0].successValue) Success"
                        } else if width < -1 {
                            choiceText = "\(choices[1].title)"
                            choiceValues = "+\(choices[1].stressValue) Stress\n+\(choices[1].successValue) Success"
                        }
                    }
                }
                .onEnded { value in
                    color = colorIdle
                    let width = value.translation.width
                    
                    if width > 100 {
                        actionRight()
                    } else if width < -100 {
                        actionLeft()
                    } else {
                        withAnimation() {
                            offset = CGSize.zero
                        }
                        choiceText = ""
                        choiceValues = ""
                    }
                }
        )
    }
    
    init(colorIdle: String, colorSelected: String, choices: [Choice], isPrologue: Bool, actionRight: @escaping () -> Void, actionLeft: @escaping () -> Void) {
        // Validate if the number of choices are equal to 2
        guard choices.count == 2 else {
            fatalError("Not enough choices.")
        }
        
        self.colorIdle = colorIdle
        self.colorSelected = colorSelected
        self.choices = choices
        self.isPrologue = isPrologue
        self.actionRight = actionRight
        self.actionLeft = actionLeft
        
        _color = State(initialValue: colorIdle)
    }
}

#Preview {
    CLDocumentComponent(colorIdle: "LightGrey", colorSelected:  "LightBlue", choices: Decision.createDecisions()[0].choices, isPrologue: false, actionRight: { }, actionLeft: { })
}
