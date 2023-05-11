//
//  StoredTeam+CoreDataProperties.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 09/05/2023.
//
//

import Foundation
import CoreData


extension StoredTeam {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredTeam> {
        return NSFetchRequest<StoredTeam>(entityName: "StoredTeam")
    }

    @NSManaged public var teamKey: Int64
    @NSManaged public var teamLogoUrl: String?
    @NSManaged public var teamName: String?
    @NSManaged public var players: NSSet?

}

// MARK: Generated accessors for players
extension StoredTeam {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: StoredPlayer)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: StoredPlayer)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

extension StoredTeam : Identifiable {

}
