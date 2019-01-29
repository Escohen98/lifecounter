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

    @IBOutlet weak var losingPlayer: UILabel! //Losing Player
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        losingPlayer.isHidden = false;
    }
    
    @IBOutlet weak var lifeTotal1: UILabel! //Player 1
    @IBOutlet weak var lifeTotal2: UILabel! //Player 2
    @IBOutlet weak var lifeTotal3: UILabel! //Player 3
    @IBOutlet weak var lifeTotal4: UILabel! //Player 4
    
    /*
     * Increments or decrements a players lifeTotal
     * based on button pressed. Stepper changes value
     * by 1. Buttons change value of stepper by 1.
     * Updates label of given player.
     */
    @IBAction func changeLife(_ sender: UIControl) {
        if sender.tag < 4 {
            //Steppers (0-3)
            updateLabel(label: (sender as! UIStepper).tag, value: String((sender as! UIStepper).value))
        } else if sender.tag >= 8 {
            //-5 Button (8-11)
            (self.view.viewWithTag(sender.tag-8) as! UIStepper).value -= 5
            updateLabel(label: sender.tag-8, value: String((self.view.viewWithTag(sender.tag-8) as! UIStepper).value))
        } else {
            //+5 Button (4-7)
            (self.view.viewWithTag(sender.tag-4) as! UIStepper).value += 5
            updateLabel(label: sender.tag-4, value: String((self.view.viewWithTag(sender.tag-8) as! UIStepper).value))
        }
    }
    
    //Updates the given label with the given value.
    func updateLabel(label : Int, value: String) {
        switch label {
        case 0:
            lifeTotal1.text = value
            break
        case 1:
            lifeTotal2.text = value
            break
        case 2:
            lifeTotal3.text = value
            break
        case 4:
            lifeTotal4.text = value
            break
        default:
            break
        }
    }
    
    //Checks if any lifeTotals are 0. If so, prints losing message.
    func checkLoser() {
        var player = 0
        if lifeTotal1.text == "0" {
            player = 1
        } else if lifeTotal2.text == "0" {
            player = 2
        } else if lifeTotal3.text == "0" {
            player = 3
        } else if lifeTotal4.text == "0" {
            player = 4
        }
        if player != 0 {
            losingPlayer.text = "Player \(player) Loses!"
        }
    }
    
}
