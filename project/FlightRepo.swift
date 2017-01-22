//
//  FlightRepo.swift
//  project
//
//  Created by Admin on 19/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class FlightRepo {
    
    //let database = CKContainer.defaultContainer().privateCloudDatabase
    
    var list:[Flight] = []
    
    
    
    
    init() {
        let flight1 = Flight(date: NSDate() as Date, aircraft: Aircraft(callsign: "OO-STB",type: "R22",origin: "helicopter"), route: "", comment: "", PIC: 1.2, dual: 1.0, Sim: 0.0, instructor: 0.0, photo: UIImage());

        list.append(flight1);
    }
    
    func addFlight(flight : Flight)
    {
        list.append(flight);
        let timestamp = String(format: "%f", NSDate.timeIntervalSinceReferenceDate);
        let id = CKRecordID(recordName: timestamp);
        
        _ = CKRecord(recordType: "Flight", recordID: id);
        
   
        
    }
    
    func deleteFlight(flight : Flight)-> Bool{
        
        
        return true;
        
            }
    
    func getList()->[Flight]{
        
        return list;
    }
    
    func getAllFlights(type : String)->[Flight]{
        var heli = [Flight]();
        for flight in list{
            if(flight.aircraft?.origin.lowercased() == type)
            {
                heli.append(flight);
            }
        }
        if (heli.count == 0) {
            heli = [];
        }
        return heli;
    }
    
    
    func fetchFlights(number : Int,flightCompletion:@escaping (Flight)-> Void,completion :@escaping (_ flights:[Flight],_ succes:Bool)->Void){
        
        var flights = [Flight]();
        
        let query = CKQuery(recordType: "Flight", predicate: NSPredicate(value: true));
        query.sortDescriptors = [NSSortDescriptor(key:"date",ascending:false)];
        
        let operation = CKQueryOperation(query: query);
        operation.resultsLimit = number;
        
        operation.queryCompletionBlock = {(cursor , error) in
            print("fetching completed");
            if error != nil {
                print(error);
            }
        
            DispatchQueue.main.async(execute: {
                completion(flights, error == nil)
            })
        
        }
        operation.recordFetchedBlock = {record in
            print("flight fetched");
            let flight = Flight(record : record);
            flights.append(flight);
            
            DispatchQueue.main.async(execute: {
                flightCompletion(flight);
            });
        }
        CKContainer.default().publicCloudDatabase.add(operation);
    }
    
    
    
    
    
}
