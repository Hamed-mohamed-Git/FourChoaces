//
//  AllSportRepository.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import Foundation


final class AllSportRepositoryDefault {
    private let allSportsApiService:AllSportsApiService!
    private let sportTeamManagerDao:SportTeamsManagerDao!
    init(allSportsApiService: AllSportsApiService!, sportTeamManagerDao: SportTeamsManagerDao!) {
        self.allSportsApiService = allSportsApiService
        self.sportTeamManagerDao = sportTeamManagerDao
    }
}





//MARK: - sports api manager!
extension AllSportRepositoryDefault:AllSportRepository{
    func getFixtureScores(sportType: SportType, leagueID: String, completion: @escaping (Result<[LeagueFixture], Error>) -> Void) {
        switch sportType {
        case .FOOTBALL:
            allSportsApiService.getFixtureScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<FootballFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageFixtureDataMappear.convertFixtureFootball(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
        case .BASKETBALL:
            allSportsApiService.getFixtureScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<BasketballFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageFixtureDataMappear.convertFixtureBasketball(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }

        case .TENNIS:
            allSportsApiService.getFixtureScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<TinnesFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageFixtureDataMappear.convertFixtureTennis(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }

        case .CRICKET:
            allSportsApiService.getFixtureScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<CricketFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    print(leagueID)
                    completion(Result.success(LeageFixtureDataMappear.convertFixtureCricket(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
        }

    }
    
    func getLiveScores(sportType: SportType, leagueID: String, completion: @escaping (Result<[LeagueLiveScore], Error>) -> Void) {
        switch sportType {
        case .FOOTBALL:
            allSportsApiService.getLiveScoreScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<FootballFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageLiveScoreDataMappear.convertLiveScoreFootball(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
        case .BASKETBALL:
            allSportsApiService.getLiveScoreScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<BasketballFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageLiveScoreDataMappear.convertLiveScoreBasketball(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }

        case .TENNIS:
            allSportsApiService.getLiveScoreScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<TinnesFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageLiveScoreDataMappear.convertLiveScoreTennis(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }

        case .CRICKET:
            allSportsApiService.getLiveScoreScores(sportType: sportType, leagueID: leagueID) { (resultItem : Result<CricketFixture,Error>) in
                switch resultItem {
                case .success(let fixtureList):
                    completion(Result.success(LeageLiveScoreDataMappear.convertLiveScoreCricket(fixture: fixtureList)))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
        }
    }
    

    
    func getLeagueTeams(sportType: SportType, leagueID: String, completion: @escaping (Result<LeagueTeams, Error>) -> Void) {
        allSportsApiService.getLeagueTeamsScores(sportType: sportType, leagueID: leagueID) { result in
            completion(result)
        }
    }
    
   
    
    
    func getLeagues(sportType:SportType,completion: @escaping (Result<Leagues, Error>) -> Void) {
        allSportsApiService.getLeagues(completion: { result in
            completion(result)
        }, sportType: sportType)
    }
    
    func getTennisPlayerById(leagueID: String, completion: @escaping (Result<[TeamItem], Error>) -> Void) {
        allSportsApiService.getTennisPlayerByLeagueId(leagueID: leagueID) { result in
            switch result {
            case .success(let tennisPlayer):
                completion(Result.success(LeageTennisPlayerMappear.converTennisPlayers(playerList: tennisPlayer.result ?? [])))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}



//MARK: - teams coreData manager!
extension AllSportRepositoryDefault  {
    func getStoredTeams(compltion: @escaping (Result<[TeamItem], Error>) -> Void) {
        sportTeamManagerDao.getTeams(compltion: compltion)
    }
    
    func addStoredTeam(team: TeamItem) {
        sportTeamManagerDao.addTeam(team: team)
    }
    
    func removeStoredTeam(team: TeamItem!,compltion: @escaping () -> Void) {
        sportTeamManagerDao.removeTeam(team: team,compltion: compltion)
    }
    
}



