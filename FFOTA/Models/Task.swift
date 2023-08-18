//
//  Task.swift
//  FFOTA
//
//  Created by yunjikim on 2023/08/09.
//

import SwiftUI
import Foundation

struct Task: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var colorName: String
    
    var color : Color {
        return Color(colorName)
    }
}
