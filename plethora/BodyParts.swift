//
//  BodyParts.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/21/26.
//

import SwiftUI

// case iterable --> automatically creates an array of all the enum's cases
// identifiable --> 128 bit identity to make sure that every instance can be uniquely distinguished from the others
// using both together is useful to loop through all enum cases for picker/menu/list
enum BodyParts: String, CaseIterable, Identifiable {
    case face, neck, shoulders, arms, hands, chest, abdoment, back, legs, feet
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.capitalized
    }
}

enum CoverageLvl: CaseIterable {
    case none, sunscreen, clothing
    
    var uvTrasmission: Double {
        switch self {
        case .none:
            return 1
        case .sunscreen:
            return 0.30
        case .clothing:
            return 0.15
        }
    }
    
    var color: Color {
        switch self {
        case .none:
            return .red
        case .sunscreen:
            return .yellow
        case .clothing:
            return .blue
        }
    }
    
    var label: String {
        switch self {
        case .none:
            return "Uncovered"
        case .sunscreen:
            return "Sunscreen"
        case .clothing:
            return "Clothing"
            
        }
    }
}
