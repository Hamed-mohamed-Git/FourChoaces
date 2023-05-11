//
//  MatchCollectionViewCell.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import UIKit

class MatchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var firstTeamImageView: UIImageView!
    
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLable: UILabel!
    @IBOutlet weak var secondTeamImageView: UIImageView!
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    
    func setUpView(match:LeagueFixture){
        firstTeamNameLabel.text = match.homeTeam
        secondTeamNameLabel.text = match.awayTeam
        secondTeamImageView.kf.setImage(with: URL(string: match.awayLogoUrl),placeholder: UIImage(named: "teamPlaceHolder"))
        firstTeamImageView.kf.setImage(with:  URL(string: match.homeLogoUrl),placeholder: UIImage(named: "teamPlaceHolder"))
        hourLable.text = match.matchTime
        stadiumLabel.text = match.stadium
        dateLabel.text = DateMapper.formatMatchDate(date: match.matchDate)
        self.layer.cornerRadius = 10.0
    }
}

class LiveMatchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var secondTeamIMage: UIImageView!
    
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var firstTeamImage: UIImageView!
    
    func setupView(match:LeagueLiveScore){
        self.layer.cornerRadius = 10.0
        liveLabel.layer.cornerRadius = 5.0
        liveLabel.layer.masksToBounds = true
        firstTeamImage.kf.setImage(with:  URL(string: match.homeLogoUrl),placeholder: UIImage(named: "teamPlaceHolder"))
        secondTeamIMage.kf.setImage(with: URL(string: match.awayLogoUrl),placeholder: UIImage(named: "teamPlaceHolder"))
        firstTeamLabel.text = match.homeTeam
        secondTeamLabel.text = match.awayTeam
        stadiumLabel.text = match.stadium
        resultLabel.text = match.finalResult
    }
}

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    
    func setupView(team:TeamItem){
        self.layer.cornerRadius = 10.0
        teamImageView.kf.setImage(with: URL(string: team.teamLogo ?? ""),placeholder: UIImage(named: "teamPlaceHolder"))
        teamNameLabel.text = team.teamName
    }
}

