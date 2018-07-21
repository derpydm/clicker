//
//  ViewController.swift
//  Clicker
//
//  Created by Sean on 30/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startLabel: UILabel!
    @IBAction func startButtonPressed(_ sender: Any) {
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.startLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }
        animator.startAnimation()
        animator.addCompletion { (_) in
            self.performSegue(withIdentifier: "customiseSegue", sender: Any.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startLabel.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.startLabel.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.startLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.startLabel.transform = CGAffineTransform.identity
        }
        animator.startAnimation()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindToStart(_ segue: UIStoryboardSegue) {
    }

}

