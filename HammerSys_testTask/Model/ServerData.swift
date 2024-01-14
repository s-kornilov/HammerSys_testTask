//
//  ServerData.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 13/01/2024.
//

import Foundation

struct MenuData: Codable {
    let pizzas: [MenuItem]
    let combo: [MenuItem]
    let desserts: [MenuItem]
    let drinks: [MenuItem]
}

struct MenuItem: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let image: String
}


