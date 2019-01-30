//
//  ViewController.swift
//  lifecounter
//
//  Created by Student User on 1/28/19.
//  Copyright © 2019 University of Washington. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   // @IBOutlet weak var losingPlayer: UILabel? = nil //Losing Player
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // losingPlayer?.isHidden = false;
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
    func updateLabel(label : Int, value: Int) {
        switch label {
        case 1:
            values[0] += value
            lifeTotal1?.text = String(values[0])
            break
        case 2:
            values[1] += value
            lifeTotal2?.text = String(values[1])
            break
        case 3:
            values[2] += value
            lifeTotal3?.text = String(values[2])
            break
        case 4:
            values[3] += value
            lifeTotal4?.text = String(values[3])
            break
        default:
            break
        }
        let loser = checkLoser()
        if loser != 0 {
           // losingPlayer?.text = "Player \(loser) Loses!"
        }
    }
    //Checks if any lifeTotals are 0. If so, prints losing message.
    func checkLoser() -> Int {
        var player = 0
        if values[0] <= 0 {
            values[0] = 0
            updateLabel(label: 1, value: 0)
            player = 1
        } else if lifeTotal2?.text == "0" {
            values[1] = 0
            updateLabel(label: 2, value: 0)
            player = 2
        } else if lifeTotal3?.text == "0" {
            values[2] = 0
            updateLabel(label: 3, value: 0)
            player = 3
        } else if lifeTotal4?.text == "0" {
            values[3] = 0
            updateLabel(label: 4, value: 0)
            player = 4
        }
        return player
    }
    func getLabel(_ sender: UIButton) -> Int{
        return 5 - sender.tag % 4
    }
}

