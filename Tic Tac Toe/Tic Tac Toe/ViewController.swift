//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Siddhant Pagariya on 6/26/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    var playerTurn = 1
    var gameActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombinations = [[0, 1, 2],[3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func buttonClicked(sender: AnyObject)
    {
        if (gameState[sender.tag] == 0 && gameActive)
        {
            gameState[sender.tag] = playerTurn
            if (playerTurn == 1)
            {
                let image = UIImage(named: "x")
                sender.setImage(image, forState: UIControlState.Normal)
                playerTurn = 2
            }
            else
            {
                let image = UIImage(named: "o")
                sender.setImage(image, forState: UIControlState.Normal)
                playerTurn = 1
            }
            
            for combination in winningCombinations
            {
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
                {
                    if (gameState[combination[0]] == 1)
                    {
                        if #available(iOS 8.0, *)
                        {
                            let alertController = UIAlertController(title: "A Winner!", message: "X's Win!", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Cancel, handler: nil))
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        else
                        {
                            let alert = UIAlertView(title: "A Winner!", message: "X's Win!", delegate: self, cancelButtonTitle: "Ok!")
                            alert.show()
                        }
                        gameActive = false
                    }
                    else
                    {
                        if #available(iOS 8.0, *)
                        {
                            let alertController = UIAlertController(title: "A Winner!", message: "O's Win!", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Cancel, handler: nil))
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        else
                        {
                            let alert = UIAlertView(title: "A Winner!", message: "O's Win!", delegate: self, cancelButtonTitle: "Ok!")
                            alert.show()
                        }
                        gameActive = false
                    }
                    playAgainButton.hidden = false
                }
            }
            var count = 0
            for states in gameState
            {
                if (states == 0)
                {
                    count++
                }
            }
            if (count == 0)
            {
                if #available(iOS 8.0, *)
                {
                    let alertController = UIAlertController(title: "No Winner!", message: "No one won the game!", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                else
                {
                    let alert = UIAlertView(title: "No Winner!", message: "No one won the game!", delegate: self, cancelButtonTitle: "Ok!")
                    alert.show()
                }
                playAgainButton.hidden = false
            }
        }
    }
    @IBAction func playAgain(sender: AnyObject) {
        restartGame()
    }
    func restartGame()
    {
        self.playerTurn = 1
        self.gameActive = true
        self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var button = UIButton()
        for (var i=0; i<9; i++)
        {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: UIControlState.Normal)
        }
        playAgainButton.hidden = true
    }
    override func viewDidLoad() {
        playAgainButton.hidden = true
    }
}