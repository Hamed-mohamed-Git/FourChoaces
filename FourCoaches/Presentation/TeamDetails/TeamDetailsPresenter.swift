//
//  TeamDetailsPresenter.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 08/05/2023.
//

import Foundation

final class TeamDetailsPresenter {
    private let repo:AllSportRepository!
    
    init(repo: AllSportRepository!) {
        self.repo = repo
    }
    
    func saveTeam(team:TeamItem){
        repo.addStoredTeam(team: team)
    }
}
