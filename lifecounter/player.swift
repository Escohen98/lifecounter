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
    private var lifeTotals : [UILabel?] = [] //collection of lifetotals
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
        lifeTotals.append(cell.lifeTotal)
        
        cell.setLosingPlayer(player: losingPlayer)
        cell.setPlayer(ID: indexPath.item + 1)
        
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        if let flowLayout = players.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = players.bounds.width / 3
            flowLayout.itemSize = CGSize(width: width, height: width)
        }
    }
    
    //Sets the appDelegate and dataSource to the players class.
    override func viewDidLoad() {
        super.viewDidLoad()
        players.delegate = self
        players.dataSource = self
        losingPlayer.isHidden = true
        //changeValue.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addPlayer(_ sender: UIButton) {
        var gameStarted = false
        for text in lifeTotals {
            if(text?.text != "20" && losingPlayer.isHidden) {
                gameStarted = true;
            }
        }
        if playerCount < 8 && !gameStarted {
            playerCount += 1
            self.players.reloadData()
        }
    }
    
    //Checks if any of the players' health has been modified. Returns true if so, otherwise returns false.
    func checkGameStart() -> Bool {
        /*for player in self.players {
        if player.lifeTotal.text == "20" || player.lifeTotal.text == "0" {
            return true
        }
        return false
        }*/
        return false
    }
    
    @IBAction func changeIncrement(_ sender: UIButton) {
        print(players.indexPathsForVisibleItems)
    }
    
    @IBOutlet weak var players: UICollectionView! //Array of PlayerCell objects
    @IBOutlet weak var losingPlayer: UILabel! //The UILabel of the player that lost
    @IBOutlet weak var changeValue: UIView!
}

//A player with a +, -, +5, -5 button, a name, and a lifetotal
class PlayersCell: UICollectionViewCell {
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
    
    //Adds the given amount of health to to health. Sets lifeTotal text to the health value. Sends message to historyVC
    @IBAction func changeLife(_ sender: UIButton) {
        let health = Int(lifeTotal.text!)! + sender.tag
        if(checkLoser(health: health)) {
            losingPlayer.text = "Player \(playerID) loses!"
            losingPlayer.isHidden = false
            lifeTotal.text = "0"
        } else {
            lifeTotal.text = "\(health)"
        }
        let historySegue = history()
        var message = "Player \(playerID)"
        if(sender.tag > 0) {
            if(sender.tag == -1) {
                message += "lost 1 life."
            } else {
            message += "lost \(abs(sender.tag)) lives."
            }
        } else {
            if(sender.tag == 1) {
                message += "gained 1 life."
            } else {
                message += "gained \(abs(sender.tag)) lives."
            }
        }
        
        historySegue.messages.append(message)
        historySegue.actions += 1
        
        let indexPath = NSIndexPath(row: sender.tag, section: 0)
        historySegue.performSegue(withIdentifier: "sendData", sender: indexPath)
    }
    
    //Changes the increment value of the +5/-5 buttons.
    func changeIncrement() {
        
    }
    
    //Checks if health is 0. Returns true if yes, false otherwise.s
    func checkLoser(health : Int) -> Bool{
        return health <= 0
    }
}
