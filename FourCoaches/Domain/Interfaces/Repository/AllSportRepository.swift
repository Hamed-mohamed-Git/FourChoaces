//
//  AllSportRepository.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 07/05/2023.
//

import Foundation

protocol AllSportRepository {
    func getLeagues(sportType:SportType,completion: @escaping (Result<Leagues, Error>) -> Void)
    func getFixtureScores(sportType:SportType,leagueID:String,completion: @escaping (Result<[LeagueFixture], Error>) -> Void)
    func getLiveScores(sportType:SportType,leagueID:String,completion: @escaping (Result<[LeagueLiveScore], Error>) -> Void)
    func getLeagueTeams(sportType:SportType,leagueID:String,completion: @escaping (Result<LeagueTeams, Error>) -> Void)
    func getTennisPlayerById(leagueID:String,completion: @escaping (Result<[TeamItem], Error>) -> Void)
    func getStoredTeams(compltion: @escaping (Result<[TeamItem],Error>) -> Void)
    func addStoredTeam(team:TeamItem)
    func removeStoredTeam(team: TeamItem!,compltion: @escaping () -> Void)
}
