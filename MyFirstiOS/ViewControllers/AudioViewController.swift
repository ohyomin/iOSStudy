//
//  AudioViewController.swift
//  MyFirstiOS
//
//  Created by 오효민 on 2023/02/18.
//

import UIKit
import AVFoundation
import MediaPlayer

class AudioViewController: UIViewController, AVAudioPlayerDelegate {
    var player: AVAudioPlayer!
    
    @IBOutlet weak var lastButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.red
        let volumeView = MPVolumeView(frame: CGRect(x:0, y:0, width: 200, height: 50))
        view.addSubview(volumeView)
        volumeView.translatesAutoresizingMaskIntoConstraints = false
        volumeView.topAnchor.constraint(equalTo: lastButton.bottomAnchor, constant: 20).isActive = true
        //volumeView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        volumeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        initPlayer()
    }
    
    @IBAction func onPause(_ sender: UIButton) {
        self.player.pause()
    }
    
    @IBAction func onPlay(_ sender: UIButton) {
        print("hmhm playe")
        self.player.play()
    }
    
    var volume: Float = 1.0
    
    @IBAction func setVolume(_ sender: UIButton) {
        print("set volume")
        //MPVolumeView.setVolume(volume: 0.5)
        volume = volume - 0.1;
        if volume <= 0 {
            volume = 1.0
        }
        player.volume = volume
    }
    
    func initPlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("cannot found")
            return
        }
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options:[])
        } catch let error as NSError {
            print("session error : \(error.localizedDescription)")
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
            //self.player.play()
        } catch let error as NSError {
            print("player error : \(error.localizedDescription)")
        }
    }
}

extension MPVolumeView {
    static func setVolume(volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: {$0 is UISlider}) as! UISlider
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            slider.value = volume
            print(AVAudioSession.sharedInstance().outputVolume)
        }
    }
}
