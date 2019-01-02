//
//  ViewController.swift
//  BullsEye
//
//  Created by Rithya on 12/23/18.
//  Copyright © 2018 Rithya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   //variables declered
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
   //All the labels connected
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var ScoreBoard: UILabel!
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    
    @IBAction func startOver(_ sender: Any) {
    //Start over
        ScoreBoard.text = "0"
        score = 0
       roundLabel.text = "0"
        round = 0
    }
    
   //happens when the app opens
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    //Slider Image
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    //Slider line color
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
    }

    
    
    
    @IBAction func showAlert() {
    //How to find the difference
    let difference = abs (targetValue - currentValue)
    let points = 100 - difference
        
    //show to find score
        score += points
        
    //Popup score
        let title: String
        if difference == 0 {
            title = "PERFECT!"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference < 10 {
            title = "Pretty Good"
        } else {
            title = "Not even close..."
        }
        
     //bonus points
        if difference == 0 {
            score += 100
        } else if difference == 1 {
            score += 50
        }
        
        
    // popup commands
        let message = "You scored \(points) points."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Keep Playing", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func sliderMoved (_ slider: UISlider) {
    //slider number
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
   
    
    
    
    func startNewRound () {
    //what to do when new round starts
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
 
    
    
    
    func updateLabels(){
    //setting target number
        targetLabel.text = String(targetValue)
    //setting score
        ScoreBoard.text = "\(score)"
    //setting round
        roundLabel.text = "\(round) "
     
        
    }

    
}

