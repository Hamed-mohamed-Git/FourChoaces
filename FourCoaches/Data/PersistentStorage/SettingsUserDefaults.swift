//
//  SettingsUserDefaults.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation

final class SettingsUserDefults{
    private var userDefaults:UserDefaults
    private static let USER_DEFAULTS_ISBRAND_NEW_kEY = "BRAND"
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    
    func getUserDefautlSetting() -> Settings {
        return Settings(isBrandNew: userDefaults.bool(forKey: SettingsUserDefults.USER_DEFAULTS_ISBRAND_NEW_kEY))
    }
    
    func setUserDefaultsSettings(settings:Settings){
        userDefaults.setValue(settings.isBrandNew, forKey: SettingsUserDefults.USER_DEFAULTS_ISBRAND_NEW_kEY)
    }
    
}
