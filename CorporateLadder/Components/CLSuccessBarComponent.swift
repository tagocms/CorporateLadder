//
//  CLSuccessBarComponent.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 02/08/25.
//

import SwiftUI

struct CLSuccessBarComponent: View {
    let color: Color
    let maxValue: Int
    let currentValue: Int
    
    let height = 30.0
    
    var progressValue: CGFloat {
        if currentValue < 0 {
            return 0
        } else if currentValue > maxValue {
            return CGFloat(maxValue)
        } else {
            return CGFloat(currentValue)
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center) {
                Image("Ladder")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22.5)
                
                Text("Success")
                    .poppinsTitle3()
            }
            
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(.white)
                            .frame(height: height)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(color)
                            .frame(width: geometry.size.width * progressValue / CGFloat(maxValue), height: height)
                    }
                }
                .frame(height: height)
                
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
    CLSuccessBarComponent(color: .clLightBlue, maxValue: 200, currentValue: 100)
}
