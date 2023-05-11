//
//  OnBoardingPageViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController,Storyboarded {
    weak var pageViewControllerDelagate: onboardingPageViewControllerDelegate!
    private lazy var currentIndex = 0
    var pageContent:[PageContent]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        pageContent = [
            PageContent(pageImage: "FirstBoard", PageTextContet: "To win, you have to score one more goal than your opponent."),
            PageContent(pageImage: "SecondBoard", PageTextContet: "Confidence is everything in this game, if you don’t think you can, you won’t."),
            PageContent(pageImage: "ThirdBoard", PageTextContet: "The mark of great sportsmen is not how good they are at their best, but how good they are at their worst.")
        ]
        setup()
        pageViewControllerDelagate.setupPageController(pageNumber: 3)
        // Do any additional setup after loading the view.
    }
    
    func turnPage(to index: Int) {
        currentIndex = index
        if let currentController = contentViewController(at: index) {
            setViewControllers([currentController], direction: .forward, animated: true)
            self.pageViewControllerDelagate.nextPageController(to: currentIndex)
        }
    }
    
    private func setup(){
        if let firstViewController = contentViewController(at: 0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension OnBoardingPageViewController :UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? OnBoardingContentViewController)?.index{
            index -= 1
            return contentViewController(at: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? OnBoardingContentViewController)?.index{
            index += 1
            return contentViewController(at: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if let pageContentViewController = pageViewController.viewControllers?.first as? OnBoardingContentViewController {
            currentIndex = pageContentViewController.index
            self.pageViewControllerDelagate?.nextPageController(to: currentIndex)
        }
    }
    
    func contentViewController(at index: Int) -> OnBoardingContentViewController? {
        if index >= pageContent.count {
            
            return nil
            
        }
        if index < 0  {
            return nil
        }
        let pageContentViewController = OnBoardingContentViewController.instantiate()
        pageContentViewController.index = index
        pageContentViewController.pageContent = pageContent[index]
        return pageContentViewController
    }
    
    
}
struct PageContent {
    let pageImage:String?
    let PageTextContet:String?
}


