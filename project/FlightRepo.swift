//
//  FlightRepo.swift
//  project
//
//  Created by Admin on 19/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

class FlightRepo : NSObject{
    var list = [Flight]()
    
    override init() {
        let flight1 = Flight(date: NSDate() as Date, aircraft: Aircraft(callsign: "OO-STB",type: "R22",origin: "helicopter"), route: "", comment: "", PIC: 1.2, dual: 1.0, Sim: 0.0, instructor: 0.0, total: 2.2, photo: UIImage());

        list.append(flight1);
    }
    
    func addFlight(flight : Flight)
    {
        list.append(flight);
    }
    
    func deleteFlight(flight : Flight)-> Bool{
        let index =  list.index(of: flight)
        if index != nil
        {
            list.remove(at: index!)
            return true;
        }
        return false;
    }
    
    func getList()->[Flight]{
        return list;
    }
    
    
    
    
}
