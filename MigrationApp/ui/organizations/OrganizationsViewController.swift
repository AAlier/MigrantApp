//
//  OrganizationsViewController.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/17/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class OrganizationsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let cellName = "OrganizationViewCell"
    let optionList = ["Изменить язык", "Изменить регион", "Изменить размер шрифта", "О приложении"]
    let colorList = [UIColor(red: 243/255.0, green: 202/255.0, blue: 62/255.0, alpha: 1.0),
                     UIColor(red: 98/255.0, green: 199/255.0, blue: 185/255.0, alpha: 1.0),
                     UIColor(red: 241/255.0, green: 106/255.0, blue: 104/255.0, alpha: 1.0),
                     UIColor(red: 188/255.0, green: 103/255.0, blue: 220/255.0, alpha: 1.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.register(OrganizationViewCell.self, forCellReuseIdentifier: cellName)
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }

}

extension OrganizationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! OrganizationViewCell
        cell.titleLbl.text = optionList[indexPath.row]
        cell.sideView.backgroundColor = colorList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


/*
 let cellName = "OrganizationViewCell"
 let optionList = ["Изменить язык", "Изменить регион", "Изменить размер шрифта", "О приложении"]
 let colorList = [UIColor(red: 243/255.0, green: 202/255.0, blue: 62/255.0, alpha: 1.0),
 UIColor(red: 98/255.0, green: 199/255.0, blue: 185/255.0, alpha: 1.0),
 UIColor(red: 241/255.0, green: 106/255.0, blue: 104/255.0, alpha: 1.0),
 UIColor(red: 188/255.0, green: 103/255.0, blue: 220/255.0, alpha: 1.0)]
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 tableView.tableFooterView = UIView()
 tableView.register(OrganizationViewCell.self, forCellReuseIdentifier: cellName)
 tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
 }
 
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return 1
 }
 
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! OrganizationViewCell
 //        cell.titleLbl.text = optionList[indexPath.row]
 //        cell.titleDescLbl.text = optionList[indexPath.row]
 //        cell.detailsLbl.text = optionList[indexPath.row]
 
 return cell
 }
 
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
 // let storyboard = UIStoryboard(name: "Main", bundle: nil)
 // let viewController = storyboard.instantiateViewController(withIdentifier: "OrganizationsViewController") as! OrganizationsViewController
 // self.present(viewController, animated: true, completion: nil)
 print(indexPath.row)
 }
 */
