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
        let aircraft1 = Aircraft(callsign: "OO-STD",type: "R44")
        let aircraft2 = Aircraft(callsign: "OO-STB",type: "R22")
        
        list.append(aircraft1)
        list.append(aircraft2 )
    
    }
    
    func addAircraft(aircraft : Aircraft){
        
        list.append(aircraft)
        
        
    }
    
    func getList() ->  [Aircraft]{
        return list;
    }
    
    
}
