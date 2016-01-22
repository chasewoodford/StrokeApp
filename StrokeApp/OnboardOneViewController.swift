//
//  Onboard1ViewController.swift
//  StrokeApp
//
//  Created by Shaun Stuart on 1/21/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//

import UIKit

class Onboard1ViewController: UIViewController {

    var authorized = false
    
    @IBOutlet weak var authorizeOutlet: UIButton!
    @IBOutlet weak var GetStartedButton: UIButton!
    
    @IBAction func doGetStarted(sender: AnyObject) {
        
        if (authorized) {
            userDataManager.setOnboarded(2)
        } else {
            authorizeHealthKit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetStartedButton.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
        
        authorizeOutlet.setTitle("Authorize Smart Beat", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "Start" && !authorized {
            authorizeOutlet.setTitle("Authorization Recieved. Get Started", forState: .Normal)
            authorized = true
            return false
        }
        return true
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
//     Get the new view controller using segue.destinationViewController.
//     Pass the selected object to the new view controller.
//            authorizeHealthKit()
//        }
    
    func authorizeHealthKit() {
        healthManager.authorizeHealthKit { (authorized,  error) -> Void in
            if authorized {
                print("HealthKit authorization received.")
            }
            else
            {
                print("HealthKit authorization denied!")
                if error != nil {
                    print("\(error)")
                }
            }
        }
    }
    

}
