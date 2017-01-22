//
//  AircraftRepo.swift
//  project
//
//  Created by Admin on 18/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import CloudKit
import CoreLocation

protocol AircraftRepoDelegate{
    func errorUpdating(_error:NSError)
    func modelUpdated();
}

class AircraftRepo :NSObject{
    
    let container: CKContainer;
    let publicDB:CKDatabase;
    let privateDB:CKDatabase;
    
    var list:[Aircraft]=[]
    
    override init() {
    
        let aircraft1 = Aircraft(callsign: "OO-STD",type: "R44",origin:"helicopter");
        let aircraft2 = Aircraft(callsign: "OO-STB",type: "R22",origin:"helicopter");
        let aircraft3 = Aircraft(callsign: "OO-TOO", type: "peper", origin:"aircraft");
        
        list.append(aircraft1);
        list.append(aircraft2);
        list.append(aircraft3);
 
 
      
        container = CKContainer.default();
        publicDB = container.publicCloudDatabase;
        privateDB = container.privateCloudDatabase;
       
    }
    
    func addAircraft(aircraft : Aircraft){
        
        list.append(aircraft);
        
       
        let timestamp = String(format: "%f", NSDate.timeIntervalSinceReferenceDate);
        let id = CKRecordID(recordName: timestamp);
        
        let record = CKRecord(recordType: "Aircraft", recordID: id);
        record["callsign"] = aircraft.callsign as CKRecordValue?;
        record["type"] = aircraft.type as CKRecordValue?;
        record["origin"] = aircraft.origin as CKRecordValue?;
  
        
            publicDB.save(record, completionHandler: { (savedRecord, saveError) in
            if saveError != nil {
            print("Error saving record: \(saveError?.localizedDescription)")
            } else {
            print("Successfully saved record!")
            }
        })
    }
    
    
    
    
    func deleteAircraft(aircraft : Aircraft)-> Bool{
        let index =  list.index(of: aircraft);
        if index != nil
        {
            list.remove(at: index!);
            return true;
        }
        return false;
    }

    
    func getList() ->  [Aircraft]{
        self.fetchAircraft();

        return list;
    }
    
    func getAircraft(callsign:String)->Aircraft?{
        for(_,element) in list.enumerated(){
            if callsign == element.callsign{
                return element;
            }
        }
        return nil;
    }
    
    func fetchAircraft(){
        
        
        let query = CKQuery(recordType: "Aircraft", predicate: NSPredicate(value: true));
        query.sortDescriptors = [NSSortDescriptor(key: "callsign",ascending : false)];
        
        let operation = CKQueryOperation(query: query);
        
        operation.queryCompletionBlock = {(cursor,error) in
            print("fetching complete");
            if error != nil{
                
            }
        }
    
    
            operation.recordFetchedBlock = {record in
                print("downloaded");
                let air = Aircraft(record : record);
                self.list.append(air);
            }
            
           
            publicDB.add(operation);
            
        
    /*
    
      
        
        publicDB.perform(query, inZoneWith: nil){
            [unowned self] (results,error) in
            if (error != nil)  {
                print();
            }
               DispatchQueue.main.async
                {
                    
                  //  self.delegate?.errorUpdating(error as NSError);
                   // print("cloud query error : \(error)");
                }
        
        
        
    
            self.list.removeAll(keepingCapacity: true);
            results?.forEach({(record:CKRecord) in
                
                self.list.append(Aircraft(callsign:record["callsign"] as! String,type:record["type"] as! String,origin:record["origin"] as! String));
        })
            DispatchQueue.main.async {
              //  self.delegate?.modelUpdated();
}
}
 */
    
}
}

    

