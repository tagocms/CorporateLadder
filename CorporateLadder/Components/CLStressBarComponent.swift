//
//  CLStressBarComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 02/08/25.
//

import SwiftUI

struct CLStressBarComponent: View {
    let color: Color
    let currentValue: Int
    
    let maxValue = 100.0
    let barHeight = 16.0
    let circleHeight = 40.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center) {
                Image("Stress")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22.5)
                
                Text("Stress")
                    .poppinsTitle3()
            }
            
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(.white)
                            .frame(height: barHeight)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(color)
                            .frame(width: geometry.size.width * CGFloat(currentValue) / CGFloat(maxValue), height: barHeight)
                        
                        Circle()
                            .fill(.white)
                            .frame(height: circleHeight)
                            .overlay(Circle().stroke(.black))
                        Text("\(currentValue.formatted())")
                            .poppinsCaption()
                            .foregroundStyle(color)
                    }
                }
                .frame(height: barHeight)
                .padding(.bottom, 12)
                
                HStack {
                    Text("0")
                        .poppinsCaption()
                    
                    Spacer()
                    
                    Text("\(maxValue.formatted())")
                        .poppinsCaption()
                }
            }
        }
    }
}

#Preview {
    CLStressBarComponent(color: .clLightBlue, currentValue: 60)
}
