//
//  LanguageViewController.swift
//  MigrationApp
//
//  Created by ITLabAdmin on 2/28/18.
//  Copyright © 2018 iCoder. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var list_lang = ["Русский", "Кыргызский", "Таджикский", "Узбекский", "Английский"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
}

extension LanguageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list_lang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LangCell") as! LangPickCellTableViewCell
        cell.title.text = list_lang[indexPath.row]
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        return cell
    }
}
