//
//  Onboard2ViewController.swift
//  StrokeApp
//
//  Created by Shaun Stuart on 1/21/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//

import UIKit
import HealthKit

class Onboard2ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var genders = ["Male", "Female", "Other"]
    var races = ["African American", "Alaska Native", "American Indian", "White", "Hispanic", "Asian American"]
    var kUnknownString: String = "Unknown"
    var hkWeight: HKQuantitySample?
    
 //@IBOutlet var profileImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var weight: UITextField!
    @IBOutlet var racePicker: UIPickerView!
    @IBOutlet var age: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet weak var SaveAndContinueButton: UIButton!
    
    @IBAction func doSave(sender: AnyObject) {
        
        if let firstNameValue = firstName.text {
            userDataManager.setFirstName(firstNameValue)
        }
        
        if let lastNameValue = lastName.text {
            userDataManager.setLastName(lastNameValue)
        }
        
        userDataManager.setRace(racePicker.selectedRowInComponent(0))
        
        userDataManager.setOnboarded(3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SaveAndContinueButton.layer.cornerRadius = 5
        
        racePicker.dataSource = self
        racePicker.delegate = self
        
        if let firstNameValue = userDataManager.getFirstName() {
            firstName.text = firstNameValue
        }
        
        if let lastNameValue = userDataManager.getLastName() {
            lastName.text = lastNameValue
        }
        
        if let raceValue = userDataManager.getRace() {
            racePicker.selectRow(raceValue, inComponent: 0, animated: true)
        }
        
        let profile = healthManager.readProfile()
        age.text = profile.age == nil ? kUnknownString : String(profile.age!)
        gender.text = genderLiteral(profile.biologicalSex?.biologicalSex)
        
        let sampleType = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)

        healthManager.readMostRecentSample(sampleType!, completion: { (mostRecentWeight, error) -> Void in
            
            if (error != nil) {
                print("Error reading weight from HealthKit Store: \(error.localizedDescription)")
                return;
            }
            
            var weightLocalizedString = ""
            self.hkWeight = mostRecentWeight as? HKQuantitySample;
            
            if let pounds = self.hkWeight?.quantity.doubleValueForUnit(HKUnit.poundUnit()) {
                let weightFormatter = NSMassFormatter()
                weightFormatter.forPersonMassUse = true;
                weightLocalizedString = weightFormatter.stringFromValue(pounds, unit: .Pound)
                print("weight=\(weightLocalizedString)")
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.weight.text = weightLocalizedString
                
            });
            
        })
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return races.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return races[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        if pickerView.tag == 1 {
        //            print(genders[row])
        //        } else {
        //            print(races[row])
        //
        //        }
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
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
    
    func genderLiteral(gender:HKBiologicalSex?)->String
    {
        var genderText = kUnknownString;
        
        if  gender != nil {
            
            switch( gender! )
            {
            case .Female:
                genderText = "Female"
            case .Male:
                genderText = "Male"
            case .Other:
                genderText = "Other"
            default:
                break;
            }
            
        }
        return genderText;
    }
    
    
}
