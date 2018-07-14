//
//  CustomiseTableViewController.swift
//  Clicker
//
//  Created by Sean on 1/7/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class CustomiseTableViewController: UITableViewController {
    var mode = "Timed"
    var counter = 0
    @IBOutlet weak var timerCell: UITableViewCell!
    @IBOutlet weak var counterStepper: UIStepper!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBAction func modeChanged(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
            mode = "Timed"
            counterStepper.value = 1
            counterLabel.text = String(Int(counterStepper.value))
            modeLabel.text = "Time"
        } else {
            mode = "Speed"
            counterStepper.value = 1
            counterLabel.text = String(Int(counterStepper.value))
            modeLabel.text = "Clicks"
            
        }
    }
    @IBAction func counterChanged(_ sender: Any) {
        counter = Int(counterStepper.value)
        counterLabel.text = String(counter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue" {
            let dest = segue.destination as! GameViewController
            dest.counter = counterStepper.value
            dest.mode = mode
        }
    }


}
