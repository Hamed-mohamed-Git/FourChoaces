//
//  LeaguesPresentation.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import Foundation

protocol LeaguesPresentation {
    func getLeagues()
}

protocol LeaguePresenterProtocol {
    func onLeaguesLoaded(leagueList:[LeaguesItem])
    func onLeaguesError(error:String)
}

final class LeaguesPresentationDefault {
    private let repositosry:AllSportRepository
    private let sportType:SportType!
    private let leaguePresenterProtocol:LeaguePresenterProtocol!
    init(repositosry: AllSportRepository, sportType: SportType!, leaguePresenterProtocol: LeaguePresenterProtocol!) {
        self.repositosry = repositosry
        self.sportType = sportType
        self.leaguePresenterProtocol = leaguePresenterProtocol
    }
}

extension LeaguesPresentationDefault:LeaguesPresentation {
    func getLeagues() {
        repositosry.getLeagues(sportType: self.sportType ?? SportType.TENNIS) { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let leaguesList):
                    self.leaguePresenterProtocol.onLeaguesLoaded(leagueList: leaguesList.result ?? [])
                case .failure(let er):
                    self.leaguePresenterProtocol.onLeaguesError(error: er.localizedDescription)
                }
            }
        }
    }
    
    
}
