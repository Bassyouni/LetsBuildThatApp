//
//  QuestionsVC.swift
//  NoStoryBoardAllInCode
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class QuestionsVC: UITableViewController {
    
    var questions = [Question]()
    
    let cellIdentifier = "cellID"
    let headerIdentifier = "headerID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Questions"
        prepareQuestions()
        self.tableView.tableFooterView = UIView()
        
        self.tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.register(HeaderForTableView.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        
        tableView.sectionHeaderHeight = 50
    }
    
    func prepareQuestions()
    {
        questions.append(Question(question: "Are you a Chineese Guy?", answers: []))
        questions.append(Question(question: "Are you a Thai Guy?", answers: []))
        questions.append(Question(question: "Are you a Egyptian Guy?", answers: []))
        questions.append(Question(question: "Are you a Italian Guy?", answers: []))
        questions.append(Question(question: "Are you a Indian Guy?", answers: []))
        questions.append(Question(question: "Are you a French Guy?", answers: []))
        questions.append(Question(question: "Are you a American Guy?", answers: []))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuestionTableViewCell
        {
            cell.questionLabel.text = questions[indexPath.row].question
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let congratsVC = CongratulationsVC()
        navigationController?.pushViewController(congratsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }



}

