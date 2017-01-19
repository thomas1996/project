//
//  AircraftRepo.swift
//  project
//
//  Created by Admin on 18/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class AircraftRepo : NSObject{
    var list = [Aircraft]()
    
    override init() {
        let aircraft1 = Aircraft(callsign: "OO-STD",type: "R44",origin:"helicopter");
        let aircraft2 = Aircraft(callsign: "OO-STB",type: "R22",origin:"helicopter");
        let aircraft3 = Aircraft(callsign: "OO-TOO", type: "peper", origin:"aircraft");
        
        list.append(aircraft1);
        list.append(aircraft2);
        list.append(aircraft3);
    
    }
    
    func addAircraft(aircraft : Aircraft){
        
        list.append(aircraft);
        
        
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
    
    
}
