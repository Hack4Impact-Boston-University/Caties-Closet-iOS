//
//  ViewControllerVolunteerFAQ.swift
//  Caties-Closet-iOS
//
//  Created by Cici Chen on 3/15/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit



class ViewControllerVolunteerFAQ: UITableViewController {
    
    
    
    let cellId = "cellId123123"
    
    var twoDimensionalArray = [
        ExpandableQuestions(isExpanded: false, questions: ["This is question 1"], answers: ["Answer to question 1"]),
        ExpandableQuestions(isExpanded: false, questions: ["This is question 2"], answers: ["Answer to question 2"]),
        ExpandableQuestions(isExpanded: false, questions: ["This is question 3"], answers: ["Answer to question 3"]),
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        for i in twoDimensionalArray[section].questions.indices{
            button.setTitle(twoDimensionalArray[section].questions[i], for: .normal)
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
        for row in twoDimensionalArray[section].answers.indices {
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
        
        return twoDimensionalArray[section].answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let answer = twoDimensionalArray[indexPath.section].answers[indexPath.row]
        
        cell.textLabel?.text = answer
        
        
        
        return cell
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
    }
}
