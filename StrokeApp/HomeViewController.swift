//
//  HomeViewController.swift
//  StrokeApp
//
//  Created by Chase Woodford on 1/21/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var CurrentRiskFactorLabel: UILabel!
    @IBOutlet weak var CurrentRiskFactorImage: UIImageView!
    @IBOutlet weak var UserTitleAndAge: UILabel!
    @IBOutlet weak var StrokeInfoButton: UIButton!
    @IBOutlet weak var StrokeTestsButton: UIButton!
    
    @IBAction func StrokeInfoButton(sender: AnyObject) {
    }

    @IBAction func StrokeTestsButton(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StrokeInfoButton.layer.cornerRadius = 5
        StrokeTestsButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}