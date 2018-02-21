//
//  OrganizationViewCell.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/17/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class OrganizationViewCell: UITableViewCell {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var titleDescLbl: UILabel!
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet var detailsLbl: UILabel!
    @IBOutlet var sideView: UIView!
    
    @IBOutlet var cardView: UIView!{
        didSet {
            cardView.layer.cornerRadius = 3
            cardView.layer.masksToBounds = false
            cardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
            cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
            cardView.layer.shadowOpacity = 0.8
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
