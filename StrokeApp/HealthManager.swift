
import Foundation
import HealthKit

class HealthManager {
    
    let healthKitStore = HKHealthStore()
    
    func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!)
    {
        // 1. Set the types you want to read from HK Store
        let healthKitTypesToRead = Set<HKObjectType>([
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!,
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!,
            ])
        
        // 2. Set the types you want to write to HK Store
        let healthKitTypesToWrite = Set<HKSampleType>([ ])
        
        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
        if !HKHealthStore.isHealthDataAvailable()
        {
            let error = NSError(domain: "com.healthhack.strokeapp", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            
            if (completion != nil)
            {
                completion(success:false, error:error)
            }
            return;
        }
        
        // 4.  Request HealthKit authorization
        healthKitStore.requestAuthorizationToShareTypes(healthKitTypesToWrite, readTypes: healthKitTypesToRead) { (success, error) -> Void in
            if( completion != nil )
            {
                completion(success:success,error:error)
            }
        }
    }
    
    func readMostRecentSample(sampleType: HKSampleType, completion: (( HKSample!, NSError!) -> Void)!) {
        
        let past = NSDate.distantPast() as NSDate!
        let now = NSDate()
        let mostRecentPredicate = HKQuery.predicateForSamplesWithStartDate(past, endDate: now, options: .None)
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let limit = 1
        
        let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: mostRecentPredicate, limit: limit, sortDescriptors: [sortDescriptor]) { (sampleQuery, results, error) -> Void in
            
            if let _ = error {
                completion(nil, error)
                return;
            }
            
            let mostRecentSample = results?.first as? HKQuantitySample
            
            if (completion != nil) {
                completion(mostRecentSample, nil)
            }
            
        }
        
        self.healthKitStore.executeQuery(sampleQuery)
        
    }
    
    func readProfile() -> (age: Int?, biologicalSex: HKBiologicalSexObject?) {
        
        var age: Int?
        var birthDay: NSDate
        var biologicalSex: HKBiologicalSexObject?
        
        do {
            try birthDay = healthKitStore.dateOfBirth()
            let today = NSDate()
            
            let differenceComponents = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: birthDay, toDate: today, options: NSCalendarOptions(rawValue:0))
            
            age = differenceComponents.year
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
        
        do {
            try biologicalSex = healthKitStore.biologicalSex()
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
        
        return (age, biologicalSex)
        
    }
    
}
