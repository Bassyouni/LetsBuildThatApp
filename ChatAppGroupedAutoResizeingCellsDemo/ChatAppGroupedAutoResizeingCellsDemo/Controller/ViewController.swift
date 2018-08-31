//
//  ViewController.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 8/26/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //MARK:- variables
    let messageCellId = "messageID123"
    
    let chatMessages = [
        [
            ChatMessage(text: "This is frist Messages", isInComing: true, date: Date.date(fromString: "27/08/2018")),
            ChatMessage(text: "Second simi long message but not that long", isInComing: true, date: Date.date(fromString: "27/08/2018")),
            ChatMessage(text: "i long message long message long message long message long message", isInComing: false, date: Date.date(fromString: "27/08/2018"))
        ],
        [
            ChatMessage(text: "yo, dawg, whatsUp", isInComing: false, date: Date.date(fromString: "28/08/2018")),
            ChatMessage(text: "This should be on the left in the bubble", isInComing: true, date: Date.date(fromString: "28/08/2018")),
            ChatMessage(text: "Complete oppisite duuuh", isInComing: false, date: Date.date(fromString: "28/08/2018"))
        ],
        [
            ChatMessage(text: "that way to late!!", isInComing: true, date: Date.date(fromString: "15/10/2018"))
        ]
    ]

    //MARK:- view's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: messageCellId)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.96, alpha: 1)
    }
    
    //MARK:- tableDateSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if let firstMessageInSection = chatMessages[section].first
        {
            let dateFormattor = DateFormatter()
            dateFormattor.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormattor.string(from: firstMessageInSection.date)
            return dateString
        }

        return "Section: \(Date())"
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.frame = CGRect(x: 25, y: 25, width: 100, height: 200)
//        headerView.backgroundColor = .green
//        headerView.layer.cornerRadius = headerView.bounds.height / 2
//
//        let label = UILabel()
//
//        if let firstMessageInSection = chatMessages[section].first
//        {
//            let dateFormattor = DateFormatter()
//            dateFormattor.dateFormat = "dd/MM/yyyy"
//            let dateString = dateFormattor.string(from: firstMessageInSection.date)
//            label.text = dateString
//        }
//
//        headerView.addSubview(label)
//
//
////        label.center = headerView.center
//
//
//        return headerView
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: messageCellId, for: indexPath) as? ChatMessageCell
        {
            cell.chatMessage = chatMessages[indexPath.section][indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}


