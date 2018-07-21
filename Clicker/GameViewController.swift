//
//  GameViewController.swift
//  Clicker
//
//  Created by Sean on 30/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//
// Timed mode is 'how many taps in x time'
// Speed mode is 'how fast can you tap x times'
import UIKit

class GameViewController: UIViewController {
    var mode =  ""
    var counter = 0.00
    var clicks = 0
    var timer = Timer()
    var time = 0.00
    var clicksNeeded: Int = 0
    var timeTaken: Double = 0.00
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var clickLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        clickLabel.isHidden = true
        timerLabel.isHidden = true
        startLabel.text = "3"
        UIView.animate(withDuration: 2, animations: {
            let transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            let transform2 = CGAffineTransform(rotationAngle: 90)
            let finalTransform = transform.concatenating(transform2)
            self.startLabel.transform = finalTransform
            self.startLabel.alpha = 0
            self.view.backgroundColor = UIColor(hex: "d1ffd4")
        }) { (_) in
            self.startLabel.transform = CGAffineTransform.identity
            self.startLabel.text = "2"
            self.startLabel.alpha = 1
            UIView.animate(withDuration: 2, animations: {
                let transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                let transform2 = CGAffineTransform(rotationAngle: 90)
                let finalTransform = transform.concatenating(transform2)
                self.startLabel.transform = finalTransform
                self.startLabel.alpha = 0
                self.view.backgroundColor = UIColor(hex: "d1ffeb")
            }) { (_) in
                self.startLabel.transform = CGAffineTransform.identity
                self.startLabel.text = "1"
                self.startLabel.alpha = 1
                UIView.animate(withDuration: 2, animations: {
                    let transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    let transform2 = CGAffineTransform(rotationAngle: 90)
                    let finalTransform = transform.concatenating(transform2)
                    self.startLabel.transform = finalTransform
                    self.startLabel.alpha = 0
                    self.view.backgroundColor = UIColor(hex: "d1fcff")
                }, completion: { (_) in
                    self.startLabel.transform = CGAffineTransform.identity
                    self.startLabel.text = "GO!"
                    self.startLabel.alpha = 1
                    UIView.animate(withDuration: 3, animations: {
                        let transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                        self.startLabel.transform = transform
                        self.startLabel.alpha = 0
                        self.view.backgroundColor = .white
                    }, completion: { (_) in
                        self.startLabel.isHidden = true
                        self.timerLabel.isHidden = false
                        self.clickLabel.isHidden = false
                        if self.mode == "Timed" {
                            self.time = self.counter
                            self.timeTaken = self.time
                            self.timedGame()
                        } else {
                            self.clicksNeeded = Int(self.counter)
                            self.speedGame()
                        }
                    })
                    
                    
                })
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func screenTapped(_ sender: Any) {
        if mode == "Speed" {
            clicks += 1
            clickLabel.text = String(clicks)
        } else {
            clicks += 1
            clickLabel.text = String(clicks)
        }
    }
    func timedGame() {
        runTimer()
        clickLabel.isHidden = false
        timerLabel.isHidden = false
        clickLabel.text = String(clicks)
    }
    func speedGame() {
        print("starting speed game")
        runTimer()
        clickLabel.isHidden = false
        timerLabel.isHidden = false
        clickLabel.text = String(clicks)
    }
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
            if self.mode == "Timed" {
                if self.time > 0.01 {
                    self.time -= 0.01
                    self.timerLabel.text = String(Float(self.time))
                } else {
                    self.timer.invalidate()
                    self.resetTimer()
                }
            } else {
                if self.clicks <= self.clicksNeeded {
                    self.time += 0.01
                    self.timerLabel.text = String(Float(self.time))
                } else {
                    self.timer.invalidate()
                    self.resetTimer()
                }
            }
        }
    }
    func resetTimer() {
        if mode == "Timed" {
            timerLabel.text = "Done!"
            UIView.animate(withDuration: 3, animations: {
                self.view.backgroundColor = UIColor(hex: "ff6961")
                let atransformation = CGAffineTransform(scaleX: 2, y: 2)
                self.timerLabel.transform = atransformation
                
            },
        completion: { (_) in
                self.performSegue(withIdentifier: "resultSegue", sender: Any.self)
            })
        } else {
            clickLabel.text = String(clicksNeeded)
            timerLabel.text = "Done!"
            UIView.animate(withDuration: 3, animations: {
                self.view.backgroundColor = .red
                let atransformation = CGAffineTransform(scaleX: 2, y: 2)
                self.timerLabel.transform = atransformation
            }, completion: { (_) in
                self.performSegue(withIdentifier: "resultSegue", sender: Any.self)
            })
        }
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let nav = segue.destination as! UINavigationController
            let dest = nav.viewControllers.first as! ResultsTableViewController
            let sentMode = mode
            if sentMode == "Timed" {
                let limit = timeTaken
                let cps = Float(clicks) / Float(limit)
                dest.result = Result(cps: cps, type: sentMode, limit: Float(limit))
            } else {
                let limit = clicksNeeded
                let cps = Float(clicks) / Float(time)
                dest.result = Result(cps: cps, type: sentMode, limit: Float(limit))
            }
            
        }
    }


}
