//
//  player.swift
//  lifecounter
//
//  Created by Eric S. Cohen on 1/30/19.
//  Copyright © 2019 University of Washington. All rights reserved.
//

import UIKit

class player: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var playerCount = 4
    //Defines how many cells to create
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerCount
    }
    
    //Initializes new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlayersCell
        cell.playerName.text = "Player \(indexPath.item + 1)"
        cell.add1.tag = 1
        cell.sub1.tag = -1
        cell.add5.tag = 5
        cell.sub5.tag = -5
        cell.add1.addTarget(self, action: "cell.changelife", for: .touchUpInside)
        cell.sub1.addTarget(self, action: "cell.changeLife", for: .touchUpInside)
        cell.add5.addTarget(self, action: "cell.changeLife", for: .touchUpInside)
        cell.sub5.addTarget(self, action: "cell.changeLife", for: .touchUpInside)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players.delegate = self
        players.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var players: UICollectionView!
    
    //Updates the given label when a button has been pressed.
    func updateLabel() {
        
    }
    
}

//A player with a +, -, +5, -5 button, a name, and a lifetotal
class PlayersCell: UICollectionViewCell{
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var lifeTotal: UILabel!
    @IBOutlet weak var add1: UIButton!
    @IBOutlet weak var sub1: UIButton!
    @IBOutlet weak var add5: UIButton!
    @IBOutlet weak var sub5: UIButton!
    
    @IBAction func changeLife(_ sender: UIButton) {
        let health = UInt(Int(lifeTotal.text!)! + sender.tag)
        print("Hi")
        if(checkLoser(health: health)) {
        } else {
            lifeTotal.text = "\(health)"
        }
    }
    
    func checkLoser(health : UInt) -> Bool{
        return health == 0
    }
}
