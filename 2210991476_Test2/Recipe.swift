//
//  Recipe.swift
//  2210991476_Test2
//
//  Created by Dakshdeep Singh on 23/11/24.
//

import Foundation
import UIKit

struct Recipe {
    var image: UIImage?
    var name: String
    var calories: String
    var time: String
    var ingredients: [String: Double]
    var instructions: String
    var category: String
    var nutritionalInfo: String
    var consumingTime: time
}

enum time: String, Codable {
    case breakfast, lunch, dinner, snack
}

var meal: [time: [Recipe]] = [
    .breakfast: [
        Recipe(name: "Omelet", calories: "100", time: "20 minutes", ingredients: ["eggs": 2, "milk": 1], instructions: "beat eggs, add milk, mix and cook", category: "Eggs", nutritionalInfo: "100 calories", consumingTime: .breakfast)
    ],
    .lunch: [],
    .dinner: [],
    .snack: []
]
