//
//  UserDataManager.swift
//  StrokeApp
//
//  Created by Shaun Stuart on 1/21/16.
//  Copyright © 2016 Chase Woodford. All rights reserved.
//

import Foundation

class UserDataManager {
    
    func getFirstName() -> String? {
        return NSUserDefaults.standardUserDefaults().objectForKey("firstName") as? String
    }
    
    func setFirstName(firstName: String) {
        NSUserDefaults.standardUserDefaults().setObject(firstName, forKey: "firstName")
    }
    
    func getLastName() -> String? {
        return NSUserDefaults.standardUserDefaults().objectForKey("lastName") as? String
    }
    
    func setLastName(lastName: String) {
        NSUserDefaults.standardUserDefaults().setObject(lastName, forKey: "lastName")
    }
    
    func getOnboarded() -> Int? {
        return NSUserDefaults.standardUserDefaults().objectForKey("onboarded") as? Int
    }
    
    func setOnboarded(onboarded: Int) {
        NSUserDefaults.standardUserDefaults().setObject(onboarded, forKey: "onboarded")
    }
    
    func getQuestionAnswer(code: Int) -> Int? {
        return NSUserDefaults.standardUserDefaults().objectForKey("answer\(code)") as? Int
    }
    
    func setQuestionAnswer(code: Int, answer: Int) {
        NSUserDefaults.standardUserDefaults().setObject(answer, forKey: "answer\(code)")
    }
    
    func getRace() -> Int? {
        return NSUserDefaults.standardUserDefaults().objectForKey("race") as? Int
    }
    
    func setRace(race: Int) {
        NSUserDefaults.standardUserDefaults().setObject(race, forKey: "race")
    }
    
    func getStrokeRisk() -> Int? {
        return NSUserDefaults.standardUserDefaults().objectForKey("risk") as? Int
    }
    
    func setStrokeRisk(risk: Int) {
        NSUserDefaults.standardUserDefaults().setObject(risk, forKey: "risk")
    }
    
}
