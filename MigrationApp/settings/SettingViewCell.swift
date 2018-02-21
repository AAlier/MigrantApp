//
//  SettingViewCellTableViewCell.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/17/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class SettingViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.cornerRadius = 3
            cardView.layer.masksToBounds = false
            cardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
            cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
            cardView.layer.shadowOpacity = 0.8
        }
    }
    
}
