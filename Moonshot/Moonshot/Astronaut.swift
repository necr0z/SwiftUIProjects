//
//  Astronaut.swift
//  Moonshot
//
//  Created by Glen Chen on 30/5/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
