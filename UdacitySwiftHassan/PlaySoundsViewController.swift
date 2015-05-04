//
//  PlaySoundsViewController.swift
//  UdacitySwiftHassan
//
//  Created by Hassan Abid on 3/21/15.
//  Copyright (c) 2015 Hassan Abid. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    let pitchEffect: AVAudioUnitTimePitch = AVAudioUnitTimePitch()
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true // fix for not playing slow and fast audio

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func slowAudioPlay(sender: UIButton) {
        resetAudio()
        playAudio(0.5)
    }
    @IBAction func fastAudioPlay(sender: UIButton) {
            resetAudio()
            playAudio(2.0)
    
    }
    @IBAction func stopButton(sender: UIButton) {
       
        if(audioPlayer.playing) {
        audioPlayer.stop()
        }
        
    }
    
    
    @IBAction func playChipMunk(sender: UIButton) {
        
        playAudioWithVariablePitch(1000)

        
    }
    
    @IBAction func playVaderAudio(sender: UIButton) {
        
        playAudioWithVariablePitch(-1000)
        
    }
    
    func playAudioWithVariablePitch(pitch: Float){
   
        resetAudio()
        
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        pitchEffect.pitch = pitch
        audioEngine.attachNode(pitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: pitchEffect, format: nil)
        audioEngine.connect(pitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    
    }
    
    
    func playAudio(rate: Float!) {
    
//        audioPlayer.stop()
        audioPlayer.rate = rate
        NSLog("rate %f", rate)
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    func resetAudio() {
    
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()}
    

}
