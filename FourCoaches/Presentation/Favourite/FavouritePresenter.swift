//
//  FavouritePresenter.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 08/05/2023.
//

import Foundation

protocol FavouritePresenterProtocol {
    func onFavouriteTeamLoaded(storedTeams:[TeamItem])
    func onFavouriteTeamDeleted()
}

final class FavouritePresenter {
    private let repo:AllSportRepository!
    private var favouritePresenterProtocol:FavouritePresenterProtocol!
    init(repo: AllSportRepository!, favouritePresenterProtocol: FavouritePresenterProtocol!) {
        self.repo = repo
        self.favouritePresenterProtocol = favouritePresenterProtocol
    }
    
    func getStoredTeams(){
        repo.getStoredTeams { result in
            switch result {
            case .success(let list):
                self.favouritePresenterProtocol.onFavouriteTeamLoaded(storedTeams: list)
            case .failure(let erro):
                print(erro)
            }
        }
    }
    
    func deleteTeam(team:TeamItem){
        repo.removeStoredTeam(team: team) {
            self.favouritePresenterProtocol.onFavouriteTeamDeleted()
        }
    }
}
