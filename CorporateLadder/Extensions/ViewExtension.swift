//
//  ViewExtension.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 01/08/25.
//

import SwiftUI

extension View where Self == Text {
    func poppinsLargeTitle() -> Text {
        font(
            Font.custom("Poppins", size: 40, relativeTo: .largeTitle)
            .weight(.semibold)
        )
    }
    
    func poppinsTitle() -> Text {
        font(
            Font.custom("Poppins", size: 32, relativeTo: .title)
                .weight(.semibold)
        )
    }
    
    func poppinsTitle2() -> Text {
        font(
            Font.custom("Poppins", size: 28, relativeTo: .title2)
                .weight(.semibold)
        )
    }
    
    func poppinsTitle3() -> Text {
        font(
            Font.custom("Poppins", size: 20, relativeTo: .title3)
                .weight(.semibold)
        )
    }
    
    func poppinsBody() -> Text {
        font(
            Font.custom("Poppins", size: 16, relativeTo: .body)
                .weight(.semibold)
        )
    }
    
    func poppinsCaption() -> Text {
        font(
            Font.custom("Poppins", size: 12, relativeTo: .caption)
                .weight(.semibold)
        )
    }
    
    func poppinsSmall() -> Text {
        font(
            Font.custom("Poppins", size: 6, relativeTo: .caption)
                .weight(.semibold)
        )
    }
    
    func robotoTitle3() -> Text {
        font(
            Font.custom("Roboto", size: 20, relativeTo: .title3)
                .weight(.semibold)
        )
    }
    
    func robotoBody() -> Text {
        font(
            Font.custom("Roboto", size: 16, relativeTo: .body)
        )
    }
    
    func robotoBodySemibold() -> Text {
        font(
            Font.custom("Roboto", size: 16, relativeTo: .body)
                .weight(.semibold)
        )
    }
    
    
    
}
