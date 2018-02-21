//
//  StatusBarController.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/17/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class StatusBarController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Change status bar color
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = UIColor(red: 196/255.0, green: 227/255.0, blue: 199/255.0, alpha: 1.0)
        }
    }
}
