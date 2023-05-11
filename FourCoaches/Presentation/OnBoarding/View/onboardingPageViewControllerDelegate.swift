//
//  onboardingPageViewControllerDelegate.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import Foundation
protocol onboardingPageViewControllerDelegate: AnyObject {
    func setupPageController(pageNumber: Int)
    func nextPageController(to index: Int)
}
