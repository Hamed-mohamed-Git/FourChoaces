//
//  Coordinator.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var child:[Coordinator]? {get}
    var navigationController:UINavigationController {set get}
    func start()
}
