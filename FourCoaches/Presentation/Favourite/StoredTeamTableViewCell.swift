//
//  StoredTeamTableViewCell.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 08/05/2023.
//

import UIKit

class StoredTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
