//
//  ViewController.swift
//  Visualizer
//
//  Created by Md. Faysal Ahmed on 13/3/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
            
    let synthesizer = AVSpeechSynthesizer()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize audio session
        
    }
    
    // MARK: Actions
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
                    
        let utterance = AVSpeechUtterance(string: "Hello! This is a demo work")

        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.5
        utterance.volume = 0.8
        synthesizer.speak(utterance)
    }
    
}
