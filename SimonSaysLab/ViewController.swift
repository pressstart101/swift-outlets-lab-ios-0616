//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    
    
    @IBAction func redButtonLabel(sender: AnyObject) {
        simonSaysGame.guessRed()
        if simonSaysGame.wonGame() == true{
            winLabel.text = "You won!"
            winLabel.hidden = false
        }else if simonSaysGame.wonGame() == false && simonSaysGame.chosenColors.count == simonSaysGame.patternToMatch.count {
            winLabel.text = "Nope, try again."
            winLabel.hidden = false
        }
    }
    @IBAction func greenButtonLabel(sender: AnyObject) {
        simonSaysGame.guessGreen()
        if simonSaysGame.wonGame() == true{
            winLabel.hidden = false
            winLabel.text = "You won!"
        }else if simonSaysGame.wonGame() == false && simonSaysGame.chosenColors.count == simonSaysGame.patternToMatch.count{
            winLabel.text = "Nope, try again."
            winLabel.hidden = false
        }
    }
    @IBAction func yellowButtonLabel(sender: AnyObject) {
        simonSaysGame.guessYellow()
        if simonSaysGame.wonGame() == true{
            winLabel.hidden = false
            winLabel.text = "You won!"
        }else if simonSaysGame.wonGame() == false && simonSaysGame.chosenColors.count == simonSaysGame.patternToMatch.count {
            winLabel.text = "Nope, try again."
            winLabel.hidden = false
        }
    }
    @IBAction func blueButtonLabel(sender: AnyObject) {
        simonSaysGame.guessBlue()
        if simonSaysGame.wonGame() == true{
            winLabel.hidden = false
            winLabel.text = "You won!"
        }else if simonSaysGame.wonGame() == false && simonSaysGame.chosenColors.count == simonSaysGame.patternToMatch.count {
            winLabel.text = "Nope, try again."
            winLabel.hidden = false
        }
    }
    
    
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.hidden = true
    }
}

// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
}
