//
//  OnboardingView.swift
//  Fructus
//
//  Created by Federico Torres on 17/06/2021.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    
    // MARK: - PREVIEW
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
