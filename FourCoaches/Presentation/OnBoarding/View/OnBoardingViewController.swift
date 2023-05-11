//
//  OnBoardingViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import UIKit

class OnBoardingViewController: UIViewController,Storyboarded {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    private weak var onBoardingPageViewController: OnBoardingPageViewController?
    private var onBoardingPresentation:OnBoardingPresentation!
    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingPresentation = OnBoardingPresentationDefault(settingsDefaultRepository: DefaultSettingsRepository())
        nextButton.isHidden = false
        skipButton.isHidden = false
        getStartedButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "page"){
            if let onBoardingViewController = segue.destination as? OnBoardingPageViewController {
                onBoardingViewController.pageViewControllerDelagate = self
                onBoardingPageViewController = onBoardingViewController
            }
            
        }else if(segue.identifier == "tabBar"){
            onBoardingPresentation.setApplicationSettings(isBrandNew: true)
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        
        onBoardingPageViewController?.turnPage(to: pageControl.currentPage + 1)
    }
    
    @IBAction func skipPages(_ sender: Any) {
    }
    
    
}

extension OnBoardingViewController: onboardingPageViewControllerDelegate {
    func setupPageController(pageNumber: Int) {
        pageControl.numberOfPages = pageNumber
    }
    
    func nextPageController(to index: Int) {
        if(index >= 2){
            nextButton.isHidden = true
            skipButton.isHidden = true
            getStartedButton.isHidden = false
        }else {
            nextButton.isHidden = false
            skipButton.isHidden = false
            getStartedButton.isHidden = true
        }
        pageControl.currentPage = index
    }
}
