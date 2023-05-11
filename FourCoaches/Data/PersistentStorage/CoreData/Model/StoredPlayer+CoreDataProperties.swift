//
//  StoredPlayer+CoreDataProperties.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 09/05/2023.
//
//

import Foundation
import CoreData


extension StoredPlayer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredPlayer> {
        return NSFetchRequest<StoredPlayer>(entityName: "StoredPlayer")
    }

    @NSManaged public var playerImageUrl: String?
    @NSManaged public var playerKey: Int64
    @NSManaged public var playerName: String?
    @NSManaged public var playerAge: String?
    @NSManaged public var playerType: String?
    @NSManaged public var playerMatch: String?
    @NSManaged public var team: StoredTeam?

}

extension StoredPlayer : Identifiable {

}
