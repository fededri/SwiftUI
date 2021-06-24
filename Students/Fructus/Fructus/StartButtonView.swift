//
//  StartButtonView.swift
//  Fructus
//
//  Created by Federico Torres on 17/06/2021.
//

import SwiftUI

struct StartButtonView: View {
    
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button(action: {
            isOnboarding = false
        }, label: {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }.padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Capsule().strokeBorder(Color.white,lineWidth: 1.25), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }) // BUTTON
        .accentColor(Color.white)
    }
}


// MARK: - PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
