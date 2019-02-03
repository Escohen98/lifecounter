//
//  history.swift
//  lifecounter
//
//  Created by Student User on 1/31/19.
//  Copyright © 2019 University of Washington. All rights reserved.
//

import UIKit

class history: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var actions = 0
    var messages : [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(actions)
        return actions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
        cell.lifeChange.text = messages[indexPath.item]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBOutlet weak var logs: HistoryCell!
}

class HistoryCell: UITableViewCell {
    @IBOutlet weak var lifeChange: UILabel!
    
}
