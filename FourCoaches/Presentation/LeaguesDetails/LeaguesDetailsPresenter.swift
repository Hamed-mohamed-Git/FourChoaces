//
//  LeaguesDetailsPresenter.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import Foundation

protocol LeaguesDetailsPresenter {
    func getLiveScores(loading: @escaping () -> Void,success: @escaping ([LeagueLiveScore]) -> Void,error: @escaping (Error) -> Void)
    func getFixtureScores(loading: @escaping () -> Void,success: @escaping ([LeagueFixture]) -> Void,error: @escaping (Error) -> Void)
    func getLeagueTeams(loading: @escaping () -> Void,success: @escaping ([TeamItem]) -> Void,error: @escaping (Error) -> Void)

}

final class LeaguesDetailsPresenterDefault {
    private let repositosry:AllSportRepository
    private let sportType:SportType!
    private let leagueId:String!
    
    init(repositosry: AllSportRepository, sportType: SportType, leagueId: String!) {
        self.repositosry = repositosry
        self.sportType = sportType
        self.leagueId = leagueId
    }
}

extension LeaguesDetailsPresenterDefault:LeaguesDetailsPresenter {
    func getLeagueTeams(loading: @escaping () -> Void, success: @escaping ([TeamItem]) -> Void, error: @escaping (Error) -> Void) {
        
        if(self.sportType.rawValue == SportType.TENNIS.rawValue){
             repositosry.getTennisPlayerById(leagueID: leagueId) { result in
                DispatchQueue.main.sync {
                    switch result {
                    case .success(let teamList):
                        success(teamList)
                    case .failure(let er):
                        error(er)
                    }
                }
            }
        }else {
            repositosry.getLeagueTeams(sportType: sportType, leagueID: leagueId) { result in
                DispatchQueue.main.sync {
                    switch result {
                    case .success(let teamList):
                        if(teamList.result != nil){
                            success(teamList.result!)
                        }
                    case .failure(let er):
                        error(er)
                    }
                }
            }
        }
        
    }
    
    
    func getFixtureScores(loading: @escaping () -> Void, success: @escaping ([LeagueFixture]) -> Void, error: @escaping (Error) -> Void) {
        repositosry.getFixtureScores(sportType: sportType, leagueID: leagueId) { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let matchList):
                    success(matchList)
                case .failure(let er):
                    error(er)
                }
            }
        }
    }
    
    func getLiveScores(loading: @escaping () -> Void, success: @escaping ([LeagueLiveScore]) -> Void, error: @escaping (Error) -> Void) {
        repositosry.getLiveScores(sportType: sportType, leagueID: leagueId) { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let matchList):
                    success(matchList)
                case .failure(let er):
                    error(er)
                }
            }
        }
    }
    
    
}
