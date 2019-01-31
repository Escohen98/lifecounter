//
//  ViewController.swift
//  lifecounter
//
//  Created by Student User on 1/28/19.
//  Copyright © 2019 University of Washington. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {

   
    @IBOutlet weak var losingPlayer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        losingPlayer?.isHidden = true
    }
    @IBOutlet weak var lifeTotal1: UILabel! //Player 1
    @IBOutlet weak var lifeTotal2: UILabel! //Player 2
    @IBOutlet weak var lifeTotal3: UILabel! //Player 3
    @IBOutlet weak var lifeTotal4: UILabel! //Player 4
    
    var values : [Int] = [20,20,20,20]
    /*
     * Increments or decrements a players lifeTotal
     * based on button pressed.
     */
    
    @IBAction func changeLife(_ sender: UIButton) {
        
        if sender.tag < 4 {
            //+1 Buttons (0-3)
            updateLabel(label: getLabel(sender), value: 1)
        } else if sender.tag >= 12 {
            //-5 Button (12-15)
            updateLabel(label: getLabel(sender), value: -5)
        } else if   sender.tag < 8 {
            //-1 Buttons (4-7)
            updateLabel(label: getLabel(sender), value: -1)
        } else {
            //+5 Button (8-11)
            updateLabel(label: getLabel(sender), value: 5)
        }
    }
    /* Updates the given label with the given value.
     * Label refers to given player
     * value refers to button pressed.
     */
    func updateLabel(label : Int, value: Int, lost : Bool = false) {
        addValues(label, value)
        switch label {
        case 0:
            lifeTotal1?.text = String(values[0])
            break
        case 1:
            lifeTotal2?.text = String(values[1])
            break
        case 2:
            lifeTotal3?.text = String(values[2])
            break
        case 3:
            lifeTotal4?.text = String(values[3])
            break
        default:
            break
        }
        if lost {
            losingPlayer?.text = "Player \(label+1) Loses!"
            losingPlayer?.isHidden = false
        } else {
            checkLoser()
        }
    }
    
    //Adds values. Sets the corresponding value to 0 if drops below that. Function used to prevent reference error.
        func addValues(_ label : Int, _ value : Int) {
        if((values[label] + value) <= 0) {
            values[label] = 0
        } else {
            values[label] += value
        }
    }
    
    //Checks if any lifeTotals are 0. If so, prints losing message. Returns losing player.
    //Returns 0 if no one has lost.
    func checkLoser() -> Int {
        var player = 0
        if values[0] <= 0 {
            values[0] = 0
            updateLabel(label: 0, value: 0, lost: true)
            player = 1
        } else if values[1] <= 0 {
            values[1] = 0
            updateLabel(label: 1, value: 0, lost: true)
            player = 2
        } else if values[2] <= 0 {
            values[2] = 0
            updateLabel(label: 2, value: 0, lost: true)
            player = 3
        } else if values[3] <= 0 {
            values[3] = 0
            updateLabel(label: 3, value: 0, lost: true)
            player = 4
        }
        return player
    }
    //Returns the label. (Player 1 is given the 0,3,7,11 tags)
    func getLabel(_ sender: UIButton) -> Int {
        return sender.tag % 4
    }
}

