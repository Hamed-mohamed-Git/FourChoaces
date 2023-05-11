//
//  AllSportsApiService.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 07/05/2023.
//

import Foundation

protocol AllSportsApiService {
    func getLeagues(completion: @escaping (Result<Leagues, Error>) -> Void, sportType:SportType)
    func getFixtureScores<D:Decodable>(sportType:SportType,leagueID:String,completion: @escaping (Result<D, Error>) -> Void)
    func getLiveScoreScores<D:Decodable>(sportType:SportType,leagueID:String,completion: @escaping (Result<D, Error>) -> Void)
    func getLeagueTeamsScores(sportType:SportType,leagueID:String,completion: @escaping (Result<LeagueTeams, Error>) -> Void)
    func getTennisPlayerByLeagueId(leagueID:String,completion: @escaping (Result<TennisPlayers, Error>) -> Void)
}
