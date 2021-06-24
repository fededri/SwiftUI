//
//  FruitModel.swift
//  Fructus
//
//  Created by Federico Torres on 17/06/2021.
//

import SwiftUI

// MARK: - FRUIS DATA MODEL

struct Fruit : Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
