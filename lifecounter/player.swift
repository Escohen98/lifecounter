//
//  player.swift
//  lifecounter
//
//  Created by Eric S. Cohen on 1/30/19.
//  Copyright © 2019 University of Washington. All rights reserved.
//

import UIKit

class player: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var playerCount = 4 //# of players
    var indexPaths = [IndexPath]() //Array of player indexes
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

        indexPaths.append(indexPath)
        
        cell.setLosingPlayer(player: losingPlayer)
        cell.setPlayer(ID: indexPath.item + 1)
        
        indexPaths.append(indexPath)
        /*cell.add1.addTarget(self, action: #selector(cell.changeLife), for: .touchUpInside)
        cell.sub1.addTarget(self, action: #selector(cell.changeLife), for: .touchUpInside)
        cell.add5.addTarget(self, action: #selector(cell.changeLife), for: .touchUpInside)
        cell.sub5.addTarget(self, action: #selector(cell.changeLife), for: .touchUpInside)*/
        return cell
    }
    
    //Sets the appDelegate and dataSource to the players class.
    override func viewDidLoad() {
        super.viewDidLoad()
        players.delegate = self
        players.dataSource = self
        losingPlayer.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addPlayer(_ sender: UIButton) {
        playerCount += 1
        players.reloadItems(at: indexPaths)
    }
    
    @IBOutlet weak var players: UICollectionView! //Array of PlayerCell objects
    @IBOutlet weak var losingPlayer: UILabel! //The UILabel of the player that lost
}

//A player with a +, -, +5, -5 button, a name, and a lifetotal
class PlayersCell: UICollectionViewCell{
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var lifeTotal: UILabel!
    @IBOutlet weak var add1: UIButton!
    @IBOutlet weak var sub1: UIButton!
    @IBOutlet weak var add5: UIButton!
    @IBOutlet weak var sub5: UIButton!
    
    
    weak var losingPlayer: UILabel!
    var playerID : Int = 0
    
    //Sets the UILabel of Losing Player.
    func setLosingPlayer(player : UILabel!) {
        losingPlayer = player
    }
    
    //Sets the player id (1-8)
    func setPlayer(ID : Int) {
        playerID = ID
    }
    
    //Adds the given amount of health to to health. Sets lifeTotal text to the health value.
    @IBAction func changeLife(_ sender: UIButton) {
        let health = Int(lifeTotal.text!)! + sender.tag
        if(checkLoser(health: health)) {
            losingPlayer.text = "Player \(playerID) loses!"
            losingPlayer.isHidden = false
            lifeTotal.text = "0"
        } else {
            lifeTotal.text = "\(health)"
        }
    }
    
    //Checks if health is 0. Returns true if yes, false otherwise.s
    func checkLoser(health : Int) -> Bool{
        return health <= 0
    }
}
