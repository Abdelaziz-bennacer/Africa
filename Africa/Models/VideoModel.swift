//
//  VideoModel.swift
//  Africa
//
//  Created by Abdelaziz Bennacer on 09/05/2024.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
