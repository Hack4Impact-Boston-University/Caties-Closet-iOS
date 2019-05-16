//
//  DonationFormButtonViewController.swift
//  Caties-Closet-iOS
//
//  Created by Hack4ImpactBostonUniversity on 4/7/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit



class DonationFormButtonViewController: UITableViewController {
    
    
    
    let cellId = "cellId123123"
    



    var twoDimensionalArray = [
        ExpandableDonationItems(isExpanded: false, items: ["Girls"], content: [["+" as AnyObject, "hi" as AnyObject, "hi" as AnyObject, "hi" as AnyObject],[8 as AnyObject, "hi" as AnyObject, "hi" as AnyObject, "hi" as AnyObject]]),
        ExpandableDonationItems(isExpanded: false, items: ["Girls"], content: [[8 as AnyObject, "hi" as AnyObject, "hi" as AnyObject, "hi" as AnyObject]]),
        ExpandableDonationItems(isExpanded: false, items: ["Girls"], content: [[8 as AnyObject, "hi" as AnyObject, "hi" as AnyObject, "hi" as AnyObject]]),
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        for i in twoDimensionalArray[section].items.indices{
            button.setTitle(twoDimensionalArray[section].items[i], for: .normal)
        }
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 163/255, blue: 8/255, alpha: 1.0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        
        let section = button.tag
        
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].content.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        
        return twoDimensionalArray[section].content.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let content = twoDimensionalArray[indexPath.section].content[indexPath.row]
        
        //cell.textLabel?.text = (String, content)

        
        return cell
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
    }
}
