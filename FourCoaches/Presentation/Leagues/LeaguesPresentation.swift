//
//  LeaguesPresentation.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import Foundation

protocol LeaguesPresentation {
    func getLeagues(loading: @escaping () -> Void,success: @escaping ([LeaguesItem]) -> Void,error: @escaping (Error) -> Void)
}

final class LeaguesPresentationDefault {
    private let repositosry:AllSportRepository
    private let sportType:SportType!
    init(repositosry: AllSportRepository, sportType: SportType!) {
        self.repositosry = repositosry
        self.sportType = sportType
    }
}

extension LeaguesPresentationDefault:LeaguesPresentation {
    func getLeagues(loading: @escaping () -> Void, success: @escaping ([LeaguesItem]) -> Void, error: @escaping (Error) -> Void) {
        repositosry.getLeagues(sportType: self.sportType ?? SportType.TENNIS) { result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let leaguesList):
                    success(leaguesList.result!)
                case .failure(let er):
                    error(er)
                }
            }
        }
    }
    
    
}
