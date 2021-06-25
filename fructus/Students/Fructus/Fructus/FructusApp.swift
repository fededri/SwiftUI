//
//  FructusApp.swift
//  Fructus
//
//  Created by Federico Torres on 17/06/2021.
//

import SwiftUI

@main struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
