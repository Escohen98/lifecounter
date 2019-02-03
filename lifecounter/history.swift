//
//  history.swift
//  lifecounter
//
//  Created by Student User on 1/31/19.
//  Copyright © 2019 University of Washington. All rights reserved.
//

import UIKit

class History: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var actions = 1
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
        print("Hi")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBOutlet var logs: UITableView!
}

class HistoryCell: UITableViewCell {
    @IBOutlet weak var lifeChange: UILabel!
    
}
