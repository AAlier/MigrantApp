//
//  SettingsController.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/16/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class SettingsController: StatusBarController {
    @IBOutlet weak var tableView: UITableView!
    let optionList = ["Изменить язык", "Изменить регион", "Изменить размер шрифта", "О приложении"]
    let colorList = [UIColor(red: 243/255.0, green: 202/255.0, blue: 62/255.0, alpha: 1.0),
                     UIColor(red: 98/255.0, green: 199/255.0, blue: 185/255.0, alpha: 1.0),
                     UIColor(red: 241/255.0, green: 106/255.0, blue: 104/255.0, alpha: 1.0),
                     UIColor(red: 188/255.0, green: 103/255.0, blue: 220/255.0, alpha: 1.0)]
    let cellName = "SettingViewCell"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(SettingViewCell.self, forCellReuseIdentifier: cellName)
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
}

extension SettingsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! SettingViewCell
            cell.title.text = optionList[indexPath.row]
            cell.borderView.backgroundColor = colorList[indexPath.row]
            return cell
    }
}

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let viewController = storyboard.instantiateViewController(withIdentifier: "OrganizationsViewController") as! OrganizationsViewController
        //self.present(viewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        
        
    }
}
