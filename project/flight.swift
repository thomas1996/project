//
//  flight.swift
//  project
//
//  Created by Admin on 18/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class Flight {
   
    
    var date : Date;
    var aircraft : Aircraft
    var comment :  String?
    var route : String?
    //houres
    var PIC : Double
    var dual : Double
    var SIM : Double
    var instructor : Double
    var total :Double
    var photo : UIImage?
    
    init(date :Date, aircraft: Aircraft, route:String, comment:String, PIC:Double, dual:Double, Sim:Double, instructor:Double,  photo:UIImage) {
        self.date = date
        self.aircraft = aircraft
        self.route = route
        self.comment = comment
        self.PIC = PIC
        self.dual = dual
        SIM = Sim
        self.instructor = instructor
        self.total = PIC + dual + Sim + instructor;
        self.photo = photo
    }
    
    
   convenience init(date :Date,total: Double){
    let aircraft:Aircraft?
    aircraft = nil
    self.init(date :date, aircraft: aircraft!, route:"(no route)", comment:"(no comment)", PIC:0.0, dual:0.0, Sim:0.0, instructor:0.0, photo:UIImage(named: " ")!)
        
    }
    
    init(record : CKRecord){
        let repo = AircraftRepo();
        
        self.date = record["date"] as! Date;
        self.aircraft = repo.getAircraft(callsign: record["Aicraft"] as! String)!;
        self.route = record["route"] as! String?;
        self.comment = record["comment"] as! String?;
        self.PIC = record["pic"] as! Double;
        self.dual = record["dual"] as! Double;
        self.SIM = record["sim"] as! Double;
        self.instructor = record["instructor"] as! Double;
        self.total = PIC + dual + SIM + instructor;
        //self.photo = photo

        
        
    }
    
    
    
    
    
}
