//
//  HomeViewController.swift
//  StrokeApp
//
//  Created by Chase Woodford on 1/21/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//
import UIKit

class HomeViewController: UIViewController {
    
    var blankString = ""
    
    @IBOutlet weak var CurrentRiskFactorImage: UIImageView!
    @IBOutlet weak var UserTitleAndAge: UILabel!
    @IBOutlet weak var StrokeInfoButton: UIButton!
    @IBOutlet weak var StrokeTestsButton: UIButton!
    
    @IBAction func StrokeInfoButton(sender: AnyObject) {
    }

    @IBAction func StrokeTestsButton(sender: AnyObject) {
    }
    
    @IBAction func ResetButton(sender: AnyObject) {
        userDataManager.setOnboarded(1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StrokeInfoButton.layer.cornerRadius = 5
        StrokeTestsButton.layer.cornerRadius = 5

        let profile = healthManager.readProfile()
        let age = profile.age == nil ? blankString : String(profile.age!)
        
        if let firstName = userDataManager.getFirstName() {
            UserTitleAndAge.text = "\(firstName), \(age)"
        }
        
        if let riskFactor = userDataManager.getStrokeRisk() {
            if (riskFactor == 1) {
                CurrentRiskFactorImage.image = UIImage(named: "LowRisk")
            } else if (riskFactor == 2) {
                CurrentRiskFactorImage.image = UIImage(named: "ModerateRisk")
            } else if (riskFactor == 3){
                CurrentRiskFactorImage.image = UIImage(named: "HighRisk")
            }
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .ScaleAspectFit
        // 4
        let image = UIImage(named: "Logo")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}