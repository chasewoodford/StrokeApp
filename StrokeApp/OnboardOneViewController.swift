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
    
    @IBAction func doGetStarted(sender: AnyObject) {
        if (!authorized) {
            authorizeHealthKit()
            authorizeOutlet.setTitle("Get Started", forState: .Normal)
        } else {
            userDataManager.setOnboarded(2)
        }
    }
    
    //    override func viewWillDisappear(animated: Bool) {
    //        print("call authorize health kit")
    //        authorizeHealthKit()
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if (!authorized) {
            // set the text of the button to Authorize
            authorizeOutlet.setTitle("Authorize Smart Beat", forState: .Normal)
        } else {
            // set the text of the button to Get Started
            authorizeOutlet.setTitle("Get Started", forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
