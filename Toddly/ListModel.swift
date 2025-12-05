//
//  ListModel.swift
//  Toddly
//
//  Created by student on 04/12/25.
//

import Foundation
import SwiftData

@Model
class Listt {
    var title: String
    var createdAt: Date
    
    init(title: String) {
        self.title = title
        self.createdAt = Date()
    }
}

