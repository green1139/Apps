//
//  ViewController.swift
//  Boi
//
//  Created by Siddhant Pagariya on 10/1/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    let synthesizer = AVSpeechSynthesizer()
    let speechUtterance = AVSpeechUtterance(string: "Boi!")
    var sound: AVAudioPlayer?
    var soundURL = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speechUtterance.rate = 0.6
        speechUtterance.pitchMultiplier = 1.25
        speechUtterance.volume = 0.75
        
        let url = NSBundle.mainBundle().URLForResource("Boy", withExtension: "gif")
        let animatedBoi = UIImage.animatedImageWithAnimatedGIFURL(url)
        
        imageView.animationImages = animatedBoi.images
        imageView.animationDuration = animatedBoi.duration
        imageView.animationRepeatCount = 1
        imageView.image = animatedBoi.images?.last
        imageView.startAnimating()
        
        soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Boi", ofType: "mp3")!)
        print(soundURL)
        do
        {
            try sound = AVAudioPlayer(contentsOfURL: soundURL)
        }
        catch
        {
            print("Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if (motion == UIEventSubtype.MotionShake)
        {
            if (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation))
            {
                shakeLabel.hidden = true
                imageView.startAnimating()
                
                if ((sound!.playing) == true)
                {
                    sound!.play()
                }
                else
                {
                    sound!.stop()
                    sound?.play()
                }
                /*if (synthesizer.speaking == false)
                {
                synthesizer.speakUtterance(speechUtterance)
                }
                else
                {
                synthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
                synthesizer.speakUtterance(speechUtterance)
                }*/
            }
        }
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        shakeLabel.hidden = false
    }
}

