//
//  SportTeamsManagerDao.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 08/05/2023.
//

import Foundation
import CoreData

protocol SportTeamsManagerDao {
    func getTeams(compltion: @escaping (Result<[TeamItem],Error>) -> Void)
    func addTeam(team:TeamItem)
    func removeTeam(team:TeamItem!,compltion: @escaping () -> Void)
}

final class SportTeamsManagerDaoDefault {
    private let coreDataStorage:CoreDataStorage!
    
    init(coreDataStorage: CoreDataStorage!) {
        self.coreDataStorage = coreDataStorage
    }
}


extension SportTeamsManagerDaoDefault : SportTeamsManagerDao {
    func getTeams(compltion: @escaping (Result<[TeamItem],Error>) -> Void){
        var teamList:[TeamItem] = []
        coreDataStorage.performBackgroundTask { context in
            do{
             let storedList =  try context.fetch(StoredTeam.fetchRequest())
                storedList.forEach { storedTeam in
                    teamList.append(TeamItem(teamKey: Int(storedTeam.teamKey), teamName: storedTeam.teamName, teamLogo: storedTeam.teamLogoUrl, players: self.convertToPlayer(storedPlayers: storedTeam.players?.allObjects as! [StoredPlayer]), coaches: nil))
                }
                compltion(Result.success(teamList))
            }catch let error{
                compltion(Result.failure(error))
            }
            
        }
    }
    
    func addTeam(team: TeamItem) {
        coreDataStorage.performBackgroundTask { context in
            if(self.getTeamById(teamId: team.teamKey, context: context).count == 0){
                let storedTeam = StoredTeam(context: context)
                storedTeam.teamName = team.teamName
                storedTeam.teamKey = Int64(team.teamKey ?? 0)
                storedTeam.teamLogoUrl = team.teamLogo
                team.players?.forEach { player in
                    let storedPlayer = StoredPlayer(context: context)
                    storedPlayer.playerName = player.playerName
                    storedPlayer.playerKey = Int64(player.playerKey ?? 0)
                    storedPlayer.playerImageUrl = player.playerImage
                    storedPlayer.playerAge = player.playerAge
                    storedPlayer.playerMatch = player.playerMatchPlayed
                    storedPlayer.playerType = player.playerType
                    storedTeam.addToPlayers(storedPlayer)
                }
                try! context.save()
            }
        }
    }
    
    func removeTeam(team:TeamItem!,compltion: @escaping () -> Void) {
        coreDataStorage.performBackgroundTask { context in
            let leagueList = self.getTeamById(teamId: team.teamKey,context: context)
            context.delete(leagueList[0])
            try! context.save()
            compltion()
        }
    }
    
    
    private func getTeamById(teamId:Int?,context:NSManagedObjectContext) -> [StoredTeam] {
        let request = StoredTeam.fetchRequest()
        request.predicate = NSPredicate(format: "teamKey == %i", teamId ?? 0 )
        return try! context.fetch(request)

    }
    
    
    private func convertToPlayer(storedPlayers:[StoredPlayer]) -> [Player]{
        var playerList:[Player] = []
        storedPlayers.forEach { storedPlayer in
            playerList.append(Player(playerKey: Int(storedPlayer.playerKey), playerName: storedPlayer.playerName, playerNumber: nil, playerCountry: nil, playerType: storedPlayer.playerType, playerAge: storedPlayer.playerAge, playerMatchPlayed: storedPlayer.playerMatch, playerGoals: nil, playerYellowCards: nil, playerRedCards: nil, playerImage: storedPlayer.playerImageUrl))
        }
        return playerList
    }
    
    
   
    
}
