//
//  FlightRepo.swift
//  project
//
//  Created by Admin on 19/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation


class FlightRepo : NSObject{
    var list = [Flight]()
    
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
