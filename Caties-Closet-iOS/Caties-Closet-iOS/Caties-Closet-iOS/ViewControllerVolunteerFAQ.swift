//
//  ViewControllerVolunteerFAQ.swift
//  Caties-Closet-iOS
//
//  Created by Hack4ImpactBostonUniversity on 3/15/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit



class ViewControllerVolunteerFAQ: UITableViewController {
    
    
    
    let cellId = "cellId123123"
    
    var twoDimensionalArray = [
        ExpandableQuestions(isExpanded: false, questions: ["What happens after I sign up?"], answers: ["A member of the Catie’s Closet team will ", "receive your application and review it. Once ","you have been accepted, you are able to ","schedule which Saturdays you would like to ","volunteer your time. If you would like to ","check availability for a specific day, please ","contact Bethany McNamara at ","bethany@catiescloset.org."]),
        ExpandableQuestions(isExpanded: false, questions: ["Is there a training or orientation before volunteering?"], answers: ["Nope! We make is easy! All you have to do ", "is show up for your shift and a Volunteer ","Coordinator will explain the process and ","what items to be looking for."]),
        ExpandableQuestions(isExpanded: false, questions: ["What if I have larger group that I would like to bring in?"], answers: ["FANTASTIC! We’re happy to have you! In ","order to best accommodate your group, ","please contact Bethany McNamara at ","bethany@catiescloset.org, with the ","number of volunteers that you are planning ","to have and we’ll be sure you’re ","taken care of!"]),
        ExpandableQuestions(isExpanded: false, questions: ["What are your corporate volunteer opportunities?"], answers: ["Great question! Catie's Closet encourages ","all corporate and business volunteer teams ","of 10 or less to participate in a great ","employee engagement opportunity! In ","order to best accommodate your group, ","please contact Bethany McNamara at ","bethany@catiescloset.org with the number ","of volunteers that you are planning to ","have and we’ll be sure you’re taken care of!"]),
        ExpandableQuestions(isExpanded: false, questions: ["What if I don’t know much about fashion?"], answers: ["That’s okay! A Catie’s Closet Volunteer ","Coordinator will be there to train you! ","They’ll explain which specific styles and ","trends are popular amongst our students. ","They’ll also teach you what donations align ","with our mission and which do not."]),
        ExpandableQuestions(isExpanded: false, questions: ["What if I can’t stay for the entire time?"], answers: ["That’s not a problem! We understand how ","busy life can be! We are thankful for your ","help!"]),
        ExpandableQuestions(isExpanded: false, questions: ["Can I bring donations with me to sort?"], answers: ["Of course!! The more, the merrier!"]),
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
