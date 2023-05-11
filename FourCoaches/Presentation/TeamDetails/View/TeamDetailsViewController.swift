//
//  TeamDetailsViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 06/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    var teamData:TeamItem!
    @IBOutlet weak var teamRankingView: UIView!
    @IBOutlet weak var saveTeamButton: UIButton!
    @IBOutlet weak var teamNameImageView: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var PlayersNumber: UILabel!
    @IBOutlet weak var playerCollectionView: UICollectionView!
    private lazy var teamDetailsPresenter:TeamDetailsPresenter =  {
        return TeamDetailsPresenter(repo: ((UIApplication.shared.delegate) as! AppDelegate).allSportsRepository)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamRankingView.layer.cornerRadius = 30.0
        teamImageView.kf.setImage(with: URL(string: teamData.teamLogo ?? ""),placeholder: UIImage(named: "logoPlaceHolder"))
        teamNameImageView.text = teamData.teamName
        PlayersNumber.text = "Team Memeber: \(teamData.players?.count ?? 0)"
        // Do any additional setup after loading the view.
    }
 
    @IBAction func saveTeam(_ sender: Any) {
        self.present(AlertManager.showSaveAlert {
            self.teamDetailsPresenter.saveTeam(team: self.teamData)
            self.saveTeamButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }, animated: true)
        
    }
    
}

extension TeamDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamData.players?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let player = teamData.players![indexPath.row]
        let playerCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
        playerCollectionViewCell.playerImageView.kf.setImage(with: URL(string: player.playerImage ?? ""),placeholder: UIImage(named: "personPlaseHolder"))
        playerCollectionViewCell.playerName.text = player.playerName
        playerCollectionViewCell.playerAge.text = player.playerAge
        playerCollectionViewCell.playerType.text = player.playerType
        playerCollectionViewCell.playerMatchPlayed.text = player.playerMatchPlayed
        playerCollectionViewCell.playerNumberLabel.text = String(indexPath.row + 1)
        playerCollectionViewCell.layer.cornerRadius = 4.0
        return playerCollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 50, height: 44)
    }
    
    
    
    
    
}
