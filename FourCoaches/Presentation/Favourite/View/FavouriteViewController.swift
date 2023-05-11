//
//  FavouriteViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import UIKit
import Kingfisher

class FavouriteViewController: UIViewController,Storyboarded, FavouritePresenterProtocol,UITableViewDelegate,UITableViewDataSource {
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var favouriteTeamsList:[TeamItem] = []
    private var presenter:FavouritePresenter!
    weak var favourieCorrdinator:FavouriteCoordinator!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FavouritePresenter(repo: ((UIApplication.shared.delegate) as! AppDelegate).allSportsRepository , favouritePresenterProtocol: self)
    

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favourieCorrdinator.tabBarDelegate.backShow()
        presenter.getStoredTeams()
    }
    
    func onFavouriteTeamLoaded(storedTeams: [TeamItem]) {
        DispatchQueue.main.sync {
            self.favouriteTeamsList = storedTeams
            self.tableView.reloadData()
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return favouriteTeamsList.count
            
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoredTeamTableViewCell") as! StoredTeamTableViewCell
            cell.layer.cornerRadius = 10.0
            cell.leagueName.text = favouriteTeamsList[indexPath.row].teamName
            cell.leagueImage.kf.setImage(with: URL(string:favouriteTeamsList[indexPath.row].teamLogo ?? ""),placeholder: UIImage(named: "sportslogom"))
            return cell
        }
        return tableView.dequeueReusableCell(withIdentifier: "StoredTeamTableViewCell") as! StoredTeamTableViewCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.present(AlertManager.showDeleteAlert {
                self.presenter.deleteTeam(team: self.favouriteTeamsList[indexPath.row])
            }, animated: true)
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Teams"
            
        }
        return "Players"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "teamDetails" {
            favourieCorrdinator.tabBarDelegate.navigateAndHidden()
            let teamDetailsViewController = segue.destination as! TeamDetailsViewController
            let team = favouriteTeamsList[self.tableView.indexPathForSelectedRow!.row]
            teamDetailsViewController.teamData = team
        }
    }
    
    func onFavouriteTeamDeleted() {
        presenter.getStoredTeams()
    }
        
    

    
    
    
    
   
    
    


   

}






