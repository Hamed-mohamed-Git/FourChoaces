//
//  Team.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 06/05/2023.
//

import Foundation

// MARK: - Fixture
struct LeagueTeams: Decodable {
    let success: Int?
    let result: [TeamItem]?
}

// MARK: - Result
struct TeamItem: Decodable {
    let teamKey: Int?
    let teamName: String?
    let teamLogo: String?
    let players: [Player]?
    let coaches: [Coach]?

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case players, coaches
    }
}

// MARK: - Coach
struct Coach: Codable {
    let coachName: String
    let coachCountry, coachAge: String?

    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
        case coachCountry = "coach_country"
        case coachAge = "coach_age"
    }
}

// MARK: - Player
struct Player: Codable {
    let playerKey: Int?
    let playerName, playerNumber: String?
    let playerCountry: String?
    let playerType: String?
    let playerAge, playerMatchPlayed, playerGoals, playerYellowCards: String?
    let playerRedCards: String?
    let playerImage: String?

    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerNumber = "player_number"
        case playerCountry = "player_country"
        case playerType = "player_type"
        case playerAge = "player_age"
        case playerMatchPlayed = "player_match_played"
        case playerGoals = "player_goals"
        case playerYellowCards = "player_yellow_cards"
        case playerRedCards = "player_red_cards"
        case playerImage = "player_image"
    }
}

// MARK: - TennisPlayers
struct TennisPlayers: Decodable {
    let success: Int?
    let result: [TennisPlayerItem]?
}

struct TennisPlayerItem: Decodable {
    let player_key: Int?
    let player_name: String?
    let player_logo:String?
}

