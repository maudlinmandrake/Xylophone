//
//  ViewController.swift
//  Xylophone
//
//  Created by Jenny Mikac, 8/24/2022
//  for Angela Yu's Complete iOS Development Bootcamp on Udemy
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Play sound from playSound() when button is tapped
    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(soundName: sender.currentTitle!)
        // when button pressed, change opacity of button background
        sender.alpha = 0.5
        // after two seconds, change button's opacity to original value
                                               // .now() grabs the current time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }

    func playSound(soundName: String) {
        // look for a sound file called C.wav
        guard let path = Bundle.main.path(forResource: soundName, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)
        // play sound if found
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

