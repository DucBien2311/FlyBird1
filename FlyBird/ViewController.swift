//
//  ViewController.swift
//  FlyBird
//
//  Created by NguyenDucBien on 11/26/16.
//  Copyright © 2016 NguyenDucBien. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
    }
    
    func drawJungle ()  {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
    
    func addBird()
    {
        bird = UIImageView(frame: CGRectMake(0, 0, 110, 68))
        bird.animationImages = [UIImage(named: "bird0.png")!,
                                UIImage(named: "bird1.png")!,
                                UIImage(named: "bird2.png")!,
                                UIImage(named: "bird3.png")!,
                                UIImage(named: "bird4.png")!,
                                UIImage(named: "bird5.png")!,]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    func flyUpAndDown () {
        UIView.animateWithDuration(3, animations: {
            self.bird.center = CGPointMake(self.view.bounds.size.width - 40, self.view.bounds.size.height - 40)
            
        }) {(finnished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(45))
            self.flyRightToLeft()
        }
        
    }
    
    
    func flyRightToLeft() {
        UIView.animateWithDuration(3, animations: {
            self.bird.center = CGPointMake(0 + 40,720 - 40)
        }) {(finnished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, -1), CGAffineTransformMakeRotation(45))
            self.flyDownAndUp()
        }
    }
    
    
    func flyDownAndUp() {
        UIView.animateWithDuration(3, animations: {
            
            self.bird.center = CGPointMake(360,0 + 40)
        }) {(finnished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(90))
            self.flyToFinnish()
        }
        
    }
    
    func flyToFinnish() {
        UIView.animateWithDuration(3, animations: {
            self.bird.center = CGPointMake(0,0 + 40)
        }) {(finnished) in
            self.bird.transform = CGAffineTransformIdentity
            self.flyUpAndDown()
        }
        
    }
    
    
    func playSong (){
        let filePath = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
}

    