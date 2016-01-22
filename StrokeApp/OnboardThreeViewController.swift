//
//  OnboardThreeViewController.swift
//  StrokeApp
//
//  Created by Chase Woodford on 1/22/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//

import UIKit

class OnboardThreeViewController: UIViewController {

    @IBOutlet weak var Question1: UISwitch!
    @IBOutlet weak var Question2: UISwitch!
    @IBOutlet weak var Question3: UISwitch!
    @IBOutlet weak var Question4: UISwitch!
    @IBOutlet weak var Question5: UISwitch!
    @IBOutlet weak var Question6: UISwitch!
    @IBOutlet weak var ShowMyStrokeRiskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShowMyStrokeRiskButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
        
        if (userDataManager.getQuestionAnswer(1) == 0) {
            Question1.setOn(false, animated: true)
        }

        if (userDataManager.getQuestionAnswer(2) == 0) {
            Question2.setOn(false, animated: true)
        }

        if (userDataManager.getQuestionAnswer(3) == 0) {
            Question3.setOn(false, animated: true)
        }

        if (userDataManager.getQuestionAnswer(4) == 0) {
            Question4.setOn(false, animated: true)
        }

        if (userDataManager.getQuestionAnswer(5) == 0) {
            Question5.setOn(false, animated: true)
        }

        if (userDataManager.getQuestionAnswer(6) == 0) {
            Question6.setOn(false, animated: true)
        }

        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var risk = 1
        var riskFactors = 0
        
        if (Question1.on) {
            risk = 2
            riskFactors++
        }
        if (Question2.on) {
            riskFactors++
        }
        if (Question3.on) {
            riskFactors++
        }
        if (Question4.on) {
            riskFactors++
        }
        if (Question5.on) {
            riskFactors++
        }
        if (Question6.on) {
            riskFactors++
        }
        
        if (riskFactors >= 2) {
            risk = 2
        }
        
        if (riskFactors >= 3) {
            risk = 3
        }
        
        userDataManager.setQuestionAnswer(1, answer: Question1.on ? 1 : 0)
        userDataManager.setQuestionAnswer(2, answer: Question2.on ? 1 : 0)
        userDataManager.setQuestionAnswer(3, answer: Question3.on ? 1 : 0)
        userDataManager.setQuestionAnswer(4, answer: Question4.on ? 1 : 0)
        userDataManager.setQuestionAnswer(5, answer: Question5.on ? 1 : 0)
        userDataManager.setQuestionAnswer(6, answer: Question6.on ? 1 : 0)
        userDataManager.setStrokeRisk(risk)
        userDataManager.setOnboarded(-1)
    }

}
