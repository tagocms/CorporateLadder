//
//  FontModifiers.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 01/08/25.
//

import SwiftUI

struct PoppinsLargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 40, relativeTo: .largeTitle)
                    .weight(.semibold)
            )
    }
}

struct PoppinsTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 32, relativeTo: .title)
                    .weight(.semibold)
            )
    }
}

struct PoppinsTitle2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 28, relativeTo: .title2)
                    .weight(.semibold)
            )
    }
}

struct PoppinsTitle3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 20, relativeTo: .title3)
                    .weight(.semibold)
            )
    }
}

struct PoppinsBody: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 16, relativeTo: .body)
                    .weight(.semibold)
            )
    }
}

struct PoppinsCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 12, relativeTo: .caption)
                    .weight(.semibold)
            )
    }
}

struct PoppinsSmall: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Poppins", size: 6, relativeTo: .caption)
                    .weight(.semibold)
            )
    }
}

struct RobotoTitle3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Roboto", size: 20, relativeTo: .title3)
                    .weight(.semibold)
            )
    }
}

struct RobotoBody: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Roboto", size: 16, relativeTo: .body)
            )
    }
}

struct RobotoBodySemibold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(
                Font.custom("Roboto", size: 16, relativeTo: .body)
                    .weight(.semibold)
            )
    }
}
