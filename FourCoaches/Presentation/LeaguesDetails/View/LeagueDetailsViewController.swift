//
//  LeagueDetailsViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import UIKit
class LeagueDetailsViewController: UIViewController {
    var sportType:SportType!
    var leagueId:String!

    @IBOutlet weak var schecduledMatchesWarningLabel: UILabel!
    @IBOutlet weak var liveMatchesWarningLabel: UILabel!
    @IBOutlet weak var teamCollectionView: UICollectionView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    var leagueName:String!
    @IBOutlet weak var liveMatchesColletionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    private var matchList:[LeagueFixture] = []
    private var LiveMatchList:[LeagueLiveScore] = []
    private var leagueTeamList:[TeamItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        liveMatchesWarningLabel.layer.cornerRadius = 10.0
        liveMatchesWarningLabel.layer.masksToBounds = true
        schecduledMatchesWarningLabel.layer.cornerRadius = 10.0
        schecduledMatchesWarningLabel.layer.masksToBounds = true
        leagueNameLabel.text = leagueName
        let presenter = LeaguesDetailsPresenterDefault(repositosry: ((UIApplication.shared.delegate) as! AppDelegate).allSportsRepository, sportType: sportType, leagueId: leagueId)
        
        presenter.getFixtureScores {
            
        } success: { matchList in
            self.matchList = matchList
            self.collectionView.reloadData()
        } error: { error in
            
        }
        presenter.getLiveScores {
            
        } success: { liveScoreList in
            self.LiveMatchList = liveScoreList
            self.liveMatchesColletionView.reloadData()
        } error: { error in
            
        }
        
        presenter.getLeagueTeams {
            
        } success: { teamList in
            self.leagueTeamList = teamList
            self.teamCollectionView.reloadData()
        } error: { error in
            
        }


        
        

    }
}


extension LeagueDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == liveMatchesColletionView){
            return LiveMatchList.count
        }else if(collectionView == teamCollectionView){
            return leagueTeamList.count
        }
        return matchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == liveMatchesColletionView){
            liveMatchesWarningLabel.isHidden = true
            let liveMatchCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "LiveMatchCollectionViewCell", for: indexPath) as! LiveMatchCollectionViewCell
            liveMatchCollectionViewCell.setupView(match: LiveMatchList[indexPath.row])
            return liveMatchCollectionViewCell
        }else if(collectionView == teamCollectionView){
            let teamCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as! TeamCollectionViewCell
            teamCollectionViewCell.setupView(team: leagueTeamList[indexPath.row])
            return teamCollectionViewCell
        }
        schecduledMatchesWarningLabel.isHidden = true
        let matchCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MatchCollectionViewCell", for: indexPath) as! MatchCollectionViewCell
        matchCollectionViewCell.setUpView(match: matchList[indexPath.row])
        return matchCollectionViewCell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "teamDetails" {
            let teamDetailsViewController = segue.destination as! TeamDetailsViewController
            let team = leagueTeamList[self.teamCollectionView.indexPathsForSelectedItems!.last!.row]
            teamDetailsViewController.teamData = team
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == liveMatchesColletionView){
            return CGSize(width: collectionView.bounds.width - 13, height: collectionView.bounds.height - 10)
        }else if(collectionView == self.collectionView){
            return CGSize(width: collectionView.bounds.width - 10, height: collectionView.bounds.height - 10)
        }
        return CGSize(width: collectionView.bounds.width / 2 - 50, height: collectionView.bounds.height)
    }
    
    
}



extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

