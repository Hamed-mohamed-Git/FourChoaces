//
//  SettingsRepository.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation

protocol SettingsRepository {
    func getIsAppBrandNew() -> Bool?
    func setIsAppBrandNew(isBrandNew:Bool?)
}
