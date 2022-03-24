//
//  VideoModel.swift
//  Africa
//
//  Created by Federico Torres on 26/06/2021.
//

import SwiftUI

struct Video : Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
