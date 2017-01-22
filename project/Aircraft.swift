//
//  Aircraft.swift
//  project
//
//  Created by Admin on 18/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import CloudKit


class Aircraft : NSObject{
    var callsign : String
    var type : String
    var origin : String
    init(callsign:String,type: String, origin :String) {
        self.callsign = callsign
        self.type = type
        self.origin = origin

    }
    init(record : CKRecord){
        self.callsign = record["callsign"] as! String;
        self.type = record["type"] as! String;
        self.origin = record["origin"] as! String;
    }
}
