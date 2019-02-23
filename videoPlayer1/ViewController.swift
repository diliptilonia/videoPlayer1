//
//  ViewController.swift
//  videoPlayer1
//
//  Created by vishnu ruhela on 23/02/19.
//  Copyright © 2019 vishnu ruhela. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var playerLooper: NSObject?
    var playerLayer:AVPlayerLayer!
    var queuePlayer: AVQueuePlayer?
    var player: AVPlayer?
    var isStopped: Bool?
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      //  addAllVideosToPlayer()
        playVideo()
        
    }
    
 
    
    
    func playVideo(){
        
                guard let path = Bundle.main.path(forResource: "video", ofType:"MP4") else {
                                debugPrint("video.m4v not found")
                                return
                            }
                            let player = AVPlayer(url: URL(fileURLWithPath: path))
                            let playerController = AVPlayerViewController()
                
                            playerController.player = player
                
                            present(playerController, animated: false) {
                                player.play()
                    
                            }
                loopVideo(player)
            }
    
    func loopVideo(_ videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            
                videoPlayer.seek(to: CMTime.zero)
                videoPlayer.play()
          
        }
    }
   
  
   

}





