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
    override func viewDidLoad() {
        super.viewDidLoad()
        if mode == "Timed" {
            time = counter
            timeTaken = time
            timedGame()
        } else {
            clicksNeeded = Int(counter)
            speedGame()
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
        clickLabel.text = String(clicks)
    }
    func speedGame() {
        print("starting speed game")
        runTimer()
        clickLabel.text = String(clicks)
    }
    @objc func updateTimer() {
        if mode == "Timed" {
            if time > 0 {
                time -= 0.01
                timerLabel.text = String(Float(time))
            } else {
                timer.invalidate()
                resetTimer()
            }
        } else {
             if clicks <= clicksNeeded {
                time += 0.01
                timerLabel.text = String(Float(time))
            } else {
                timer.invalidate()
                resetTimer()
            }
        }

    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    func resetTimer() {
        if mode == "Timed" {
            performSegue(withIdentifier: "resultSegue", sender: Any.self)
        } else {
            performSegue(withIdentifier: "resultSegue", sender: Any.self)
        }
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            
        }
    }


}
