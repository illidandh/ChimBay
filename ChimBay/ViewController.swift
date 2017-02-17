//
//  ViewController.swift
//  ChimBay
//
//  Created by iOS Student on 2/17/17.
//  Copyright © 2017 NKT. All rights reserved.
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
    func drawJungle()
    {
        let background = UIImageView(image:UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }
    func addBird()
    {
        bird = UIImageView(frame: CGRect(x: 40, y: 40, width: 110, height: 68))
        bird.animationImages = [UIImage(named: "bird0.png")!,
        UIImage(named: "bird1.png")!,
        UIImage(named: "bird2.png")!,
        UIImage(named: "bird3.png")!,
        UIImage(named: "bird4.png")!
        ]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    func flyUpAndDown()
    {
        UIView.animate(withDuration: 4, animations: {
            self.bird.center = CGPoint(x: self.view.bounds.size.width - 40,y: self.view.bounds.size.height - 40 )
        }) {(finished) in
//            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI_4)))
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1)
            UIView.animate(withDuration: 3, animations: {
                self.bird.center = CGPoint(x: 40 , y: self.view.bounds.height - 40)
            }) {(finished) in
                self.bird.transform = self.bird.transform.scaledBy(x: 1, y: -1).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI_2 + M_PI_4)))
                UIView.animate(withDuration: 3, animations: {
                    self.bird.center = CGPoint(x: self.view.bounds.width - 40, y: 40)
                }){(finished) in
                    self.bird.transform = self.bird.transform.scaledBy(x: 1, y: -1).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI + M_PI_4)))
                    UIView.animate(withDuration: 3, animations: {
                        self.bird.center = CGPoint(x: 40, y: 40)
                    })
                    {
                        (finished) in
                        self.bird.transform = CGAffineTransform.identity
                        self.flyUpAndDown()
                    }
                }
            }
        }
        }
    func playSong()
    {
        let filePath = Bundle.main.path(forResource: "music", ofType: "mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url as URL)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    }



