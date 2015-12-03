//  Copyright (c) 2015 Google. All rights reserved.

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate, UIAlertViewDelegate {

  enum GameState: NSInteger{
    case NotStarted
    case Playing
    case Paused
    case Ended
  }

  /// The interstitial ad.
  var interstitial: GADInterstitial?

  /// The countdown timer.
  var timer: NSTimer?

  /// The game counter.
  var counter = 3

  /// The state of the game.
  var gameState = GameState.NotStarted

  /// The date that the timer was paused.
  var pauseDate: NSDate?

  /// The last fire date before a pause.
  var previousFireDate: NSDate?

  @IBOutlet var gameText: UILabel!

  @IBOutlet var playAgainButton: UIButton!

    @IBOutlet weak var DFPbannerView: DFPBannerView!
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    startNewGame()
    DFPbannerView.adUnitID = "ca-app-pub-3333820692385997/1068624668"
    DFPbannerView.rootViewController = self
    let request = DFPRequest()
    ///request.testDevices = [kGADSimulatorID]
    DFPbannerView.loadRequest(request)
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    pauseGame()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    resumeGame()
  }

  // MARK: Game logic

  private func startNewGame() {
    gameState = .Playing
    counter = 0
    playAgainButton.hidden = true
    loadInterstitial()
    gameText.text = String(counter)
    timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
      target: self,
      selector:"decrementCounter:",
      userInfo: nil,
      repeats: true)
  }

  private func pauseGame() {
    if (gameState != .Playing) {
      return
    }
    gameState = .Paused

    // Record the relevant pause times.
    pauseDate = NSDate()
    previousFireDate = timer!.fireDate

    // Prevent the timer from firing while app is in background.
    timer!.fireDate = NSDate.distantFuture() 
  }

  private func resumeGame() {
    if (gameState != .Paused) {
      return
    }
    gameState = .Playing

    // Calculate amount of time the app was paused.
    let pauseTime = pauseDate!.timeIntervalSinceNow * -1

    // Set the timer to start firing again.
    timer!.fireDate = previousFireDate!.dateByAddingTimeInterval(pauseTime)
  }

  func decrementCounter(timer: NSTimer) {
    counter--
    if (counter > 0) {
      gameText.text = String(counter)
    } else {
      endGame()
    }
  }

  private func endGame() {
    gameState = .Ended
    gameText.text = "Game over!"
    playAgainButton.hidden = false
    timer!.invalidate()
    timer = nil
  }

  // MARK: Interstitial button actions

  @IBAction func playAgain(sender: AnyObject) {
    if (interstitial!.isReady) {
      interstitial!.presentFromRootViewController(self)
    } else {
      UIAlertView(title: "Interstitial not ready",
        message: "The interstitial didn't finish loading or failed to load",
        delegate: self,
        cancelButtonTitle: "Drat").show()
    }
  }

  private func loadInterstitial() {
    interstitial = GADInterstitial(adUnitID: "ca-app-pub-3333820692385997/6476029868")
    interstitial!.delegate = self

    // Request test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made. GADInterstitial automatically returns test ads when running on a
    // simulator.
    let request = GADRequest()
    // Requests test ads on test devices.
    ///request.testDevices = [kGADSimulatorID]
    interstitial!.loadRequest(request)
  }

  // MARK: UIAlertViewDelegate implementation

  func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
    //startNewGame()
  }

  // MARK: GADInterstitialDelegate implementation

  func interstitialDidFailToReceiveAdWithError (
    interstitial: GADInterstitial,
    error: GADRequestError) {
      print("interstitialDidFailToReceiveAdWithError: %@" + error.localizedDescription)
  }

  func interstitialDidDismissScreen (interstitial: GADInterstitial) {
    print("interstitialDidDismissScreen")
    loadInterstitial()
    let request = DFPRequest()
    ///request.testDevices = [kGADSimulatorID]
    DFPbannerView.loadRequest(request)
  }
}