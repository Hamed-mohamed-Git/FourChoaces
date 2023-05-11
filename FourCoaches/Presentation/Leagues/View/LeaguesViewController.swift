//
//  LeaguesViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import UIKit
import Kingfisher

class LeaguesViewController: UIViewController,Storyboarded {
    weak var leaguesCoordinator:LeaguesCoordinator!
    var sportType:SportType!
    private lazy var leagueList:[LeaguesItem] = []
    
    @IBOutlet weak var leagesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LeaguesPresentationDefault(repositosry: ((UIApplication.shared.delegate) as! AppDelegate).allSportsRepository, sportType: sportType,leaguePresenterProtocol: self).getLeagues()

        // Do any additional setup after loading the view.
    }
    
    
}

extension LeaguesViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let leagueTableViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCollectionViewCell", for: indexPath) as! LeagueCollectionViewCell
        leagueTableViewCell.layer.cornerRadius =  10.0
        leagueTableViewCell.leagueLabel.text = leagueList[indexPath.row].league_name
        leagueTableViewCell.leagueImageView.kf.setImage(with: URL(string: leagueList[indexPath.row].league_logo ?? ""),placeholder: UIImage(named: "leaguePlaceHolder"))
        leagueTableViewCell.leagueImageView.layer.cornerRadius = (leagueTableViewCell.leagueImageView.frame.width / 2)
        leagueTableViewCell.leagueLabel.layer.masksToBounds = true
        return leagueTableViewCell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 30, height: 50)
    }
    
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "leagueDetail" {
            let leagueDetailsViewController = segue.destination as! LeagueDetailsViewController
            let league = leagueList[self.leagesCollectionView.indexPathsForSelectedItems!.last!.row]
            leagueDetailsViewController.sportType = self.sportType
            leagueDetailsViewController.leagueId = String(league.league_key ?? 0)
            leagueDetailsViewController.leagueName = league.league_name
        }
    }
    
    
    
        
    
}


extension LeaguesViewController:LeaguePresenterProtocol {
    func onLeaguesLoaded(leagueList: [LeaguesItem]) {
        self.leagueList = leagueList
        self.leagesCollectionView.reloadData()
    }
    
    func onLeaguesError(error: String) {
        print(error)

    }
    
    
}
