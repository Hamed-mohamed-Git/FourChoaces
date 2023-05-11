//
//  OnBoardingPresentaion.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import Foundation

protocol OnBoardingPresentation {
    func setApplicationSettings(isBrandNew:Bool)
}

final class OnBoardingPresentationDefault {
    private let settingsDefaultRepository:SettingsRepository!
    
    init(settingsDefaultRepository: SettingsRepository!) {
        self.settingsDefaultRepository = settingsDefaultRepository
    }
    
}

extension OnBoardingPresentationDefault:OnBoardingPresentation {
    
    func setApplicationSettings(isBrandNew:Bool){
        settingsDefaultRepository.setIsAppBrandNew(isBrandNew: isBrandNew)
    }
    
}
