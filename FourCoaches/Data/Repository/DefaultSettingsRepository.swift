//
//  DefaultSettingsRepository.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation

final class DefaultSettingsRepository {
    private var settingsUserDefaults: SettingsUserDefults?
    
    init(settingsUserDefaults: SettingsUserDefults? = SettingsUserDefults()) {
        self.settingsUserDefaults = settingsUserDefaults
    }
    
}

extension DefaultSettingsRepository:SettingsRepository {
    func getIsAppBrandNew() -> Bool? {
        return settingsUserDefaults?.getUserDefautlSetting().isBrandNew
    }
    
    func setIsAppBrandNew(isBrandNew: Bool?) {
        settingsUserDefaults?.setUserDefaultsSettings(settings: Settings(isBrandNew: isBrandNew))
    }
}


