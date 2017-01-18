//
//  Aircraft.swift
//  project
//
//  Created by Admin on 18/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation


class Aircraft : NSObject{
    var callsign : String
    var type : String
    init(callsign:String,type: String) {
        self.callsign = callsign
        self.type = type

    }
}
