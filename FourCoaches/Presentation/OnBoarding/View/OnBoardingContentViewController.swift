//
//  OnBoardingContentViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import UIKit

class OnBoardingContentViewController: UIViewController,Storyboarded {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var pageImageView: UIImageView!
    var pageContent:PageContent!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //pageLabel.text = pageContent.PageTextContet
        pageImageView.image = UIImage(named: pageContent.pageImage ?? "")
        //prepareGradient()
    }
    

    
   
    
}
