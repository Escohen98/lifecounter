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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    @IBOutlet weak var lifetotal1: UILabel!
    @IBOutlet weak var lifetotal2: UILabel!
    @IBOutlet weak var lifetotal3: UILabel!
    @IBOutlet weak var lifetotal4: UILabel!
    
    @IBAction func changeLife(_ sender: UIControl) {
        if sender is UIStepper {
            switch (sender as! UIStepper).value {
            case "add51":
                lifetotal1.text! = sender.value();
            }
        } else if sender is UIButton {
            switch sender.titleLabel! {
            case "":
            break;
            default:
            break;
            }
        }
    }
    
}
