//
//  ViewController.swift
//  AsyncImageViewWithCashe
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.backgroundView?.backgroundColor = .black
        return tableView
    }()
    
    var cells = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...30
        {
            cells.append("http://placehold.it/120x120&text=image\(i)")
        }
        
        tableView.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height - 50)
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "imageCell")

    }




}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageTableViewCell
        {
            cell.tempImageView.loadImageUsingUrlString(urlString: cells[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

