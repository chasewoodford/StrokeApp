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
    @IBOutlet weak var StrokeInfoButton: UIButton!
    @IBOutlet weak var StrokeTestsButton: UIButton!
    @IBOutlet weak var SendToDoctorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}