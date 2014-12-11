//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Antonio Caravaca Vega on 11/12/14.
//  Copyright (c) 2014 Antonio Caravaca Vega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayedLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var balloons:[Balloon] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateBalloons(99)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        
        if currentIndex < 99 {
            
        let balloon = balloons[currentIndex]
        
        displayedLabel.text = "Balloon Nº \(balloon.number + 1)"
        backgroundImage.image = balloon.image
        
        currentIndex += 1
            
        } else {
            displayedLabel.text = "No more Balloons, start over!"
            backgroundImage.image = UIImage(named: "BerlinTVTower.jpg")
            
            currentIndex = 0
        }
        
    }
    
    func generateBalloons(number:Int) {
        var x = 0
        do {
            var balloon = Balloon()
            
            balloon.number = x
            
            var randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            
            balloons.append(balloon)
            
            x++
            
        } while x < number
    }
}

