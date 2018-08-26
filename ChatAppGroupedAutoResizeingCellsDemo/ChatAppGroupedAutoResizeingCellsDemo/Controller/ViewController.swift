//
//  ViewController.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 8/26/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let messageCellId = "id"
    
    let textMessages = ["This is frist Messages", "Second simi long message but not that long", "i long message long message long message long message long message"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: messageCellId)
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: messageCellId, for: indexPath) as? ChatMessageCell
        {
            cell.messageLabel.text = textMessages[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }


}

