//
//  Fruit.swift
//  FruitGalleryCoho11
//
//  Created by Stephen Truitt on 9/11/26.
//

import SwiftUI
import Foundation

//MARK: - Data Model

struct Fruit:Identifiable {
    
    let id:UUID = UUID()
    let emoji: String
    let name: String
    let color: Color
}
