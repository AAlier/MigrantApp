//
//  ReferenceViewController.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/17/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ReferenceViewController: SJSegmentedViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storyboard = self.storyboard {
            let firstViewController = storyboard.instantiateViewController(withIdentifier: "OrganizationsViewController")
            firstViewController.title = "Организации"
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "OrganizationsViewController")
            secondViewController.title = "Карта"
            
            let segmentedViewController = SJSegmentedViewController(headerViewController: nil,
                                                                    segmentControllers: [firstViewController, secondViewController])
            
            addChildViewController(segmentedViewController)
            self.view.addSubview(segmentedViewController.view)
            segmentedViewController.view.frame = self.view.bounds
            segmentedViewController.didMove(toParentViewController: self)
        }
    }
}
