//
//  HomeViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import UIKit
import Reachability

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,Storyboarded {
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    @IBOutlet weak var fourCoachesCardImage: UIImageView!
    @IBOutlet weak var fourCoachesView: UIView!
    private lazy var reachability:Reachability = {
        try! Reachability()
    }()
    var sportType:SportType!
    private var isReached:Bool = true
    weak var homeCoordinator:HomeCoordinaor!
    private let sportItems = [SportItem(name: SportType.FOOTBALL, photo: "football 1"),
                              SportItem(name: SportType.BASKETBALL, photo: "basketball 1"),
                              SportItem(name: SportType.CRICKET, photo: "cricket"),
                              SportItem(name: SportType.TENNIS, photo: "tennis 1")]

    override func viewDidLoad() {
        super.viewDidLoad()
        fourCoachesView.layer.cornerRadius = 15.0
        fourCoachesCardImage.layer.cornerRadius = 10.0
        fourCoachesView.layer.masksToBounds = true
        DispatchQueue.main.async {
            self.reachability.whenUnreachable = { unreached in
                self.present(AlertManager.showEnternetConnectionAlert {
                    print(unreached)
                }, animated: true)
                self.isReached = false
            }
            self.reachability.whenReachable = { reached in
                self.isReached = true
            }
            
            try! self.reachability.startNotifier()
        }
    }
    
   

    
    override func viewWillAppear(_ animated: Bool) {
        homeCoordinator.tabBarDelegate.backShow()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        sportType = sportItems[sportsCollectionView.indexPathsForSelectedItems?.last!.row ?? 0].name
        if let leaguesViewController = segue.destination as? LeaguesViewController {
            leaguesViewController.sportType = sportType
        }
        self.homeCoordinator.tabBarDelegate.navigateAndHidden()
    }
  
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return isReached
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        cell.layer.cornerRadius = 20.0
        cell.sportImageView.image = UIImage(named: sportItems[indexPath.row].photo)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 20, height: collectionView.frame.height / 2 - 50)
    }
    
    

}


struct SportItem {
    let name:SportType
    let photo:String
}
