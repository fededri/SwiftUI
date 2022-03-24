//
//  CenterModifier.swift
//  Africa
//
//  Created by Federico Torres on 21/03/2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }


}
