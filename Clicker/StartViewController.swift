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
        UIView.animate(withDuration: 2, animations: {
            self.startLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }) { (_) in
            self.startLabel.transform = CGAffineTransform.identity
            self.performSegue(withIdentifier: "customiseSegue", sender: Any.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindToStart(_ segue: UIStoryboardSegue) {
    }

}

