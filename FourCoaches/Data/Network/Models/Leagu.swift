//
//  League.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import Foundation

// MARK: - Leagues
struct Leagues:Decodable {
    let success: Int?
    let result: [LeaguesItem]?
}

// MARK: - Result
struct LeaguesItem:Decodable {
    let league_key: Int?
    let league_name: String?
    let country_key: Int?
    let country_name: String?
    let league_logo: String?
    let country_logo: String?
}
