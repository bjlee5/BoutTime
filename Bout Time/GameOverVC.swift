//
//  GameOverVC.swift
//  Bout Time
//
//  Created by MacBook Air on 4/22/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import UIKit

class GameOverVC: UIViewController {
    
    var totalPassed = Int()
    
    @IBOutlet weak var correctLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = "You ordered \(totalPassed) out of 6 President's correctly!"
    }    
}
