//
//  ViewExtension.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 01/08/25.
//

import SwiftUI

extension View {
    func poppinsLargeTitle() -> some View {
        modifier(PoppinsLargeTitle())
    }
    
    func poppinsTitle() -> some View {
        modifier(PoppinsTitle())
    }
    
    func poppinsTitle2() -> some View {
        modifier(PoppinsTitle2())
    }
    
    func poppinsTitle3() -> some View {
        modifier(PoppinsTitle3())
    }
    
    func poppinsBody() -> some View {
        modifier(PoppinsBody())
    }
    
    func poppinsCaption() -> some View {
        modifier(PoppinsCaption())
    }
    
    func poppinsSmall() -> some View {
        modifier(PoppinsSmall())
    }
    
    func robotoTitle3() -> some View {
        modifier(RobotoTitle3())
    }
    
    func robotoBody() -> some View {
        modifier(RobotoBody())
    }
    
    func robotoBodySemibold() -> some View {
        modifier(RobotoBodySemibold())
    }
    
    
    
}
