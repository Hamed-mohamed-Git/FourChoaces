//
//  Constants.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 07/05/2023.
//

import Foundation

// MARK: - CONSTANTS
struct Constanst {
    static let ALL_SPOSRTS_API_BASE_URL = "https://apiv2.allsportsapi.com/"
    static let ALL_SPOSRTS_API_USER_KEY = "4f32109f86c603273fb57add42d97e4cb66d9bd2fda26b39c39fff36d72fe320"
    static let YEAR_MONTH_DAY_DATE_FORMAT = "yyyy-MM-dd"
    static let MONTH_DAY_DATE_FORMATER = "MMM d"
}


// MARK: - sportTypes
enum SportType:String{
    case FOOTBALL = "football/"
    case BASKETBALL = "basketball/"
    case TENNIS = "tennis/"
    case CRICKET = "cricket/"
}


// MARK: - MetTypes
enum MetTypes:String {
    case LIVE_SCORE = "Livescore"
    case FIXTURE = "Fixtures"
    case TEAMS = "Teams"
    case PLAYERS = "Players"
    case LEAGUES = "Leagues"
}

