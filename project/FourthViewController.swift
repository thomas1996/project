//
//  FourthViewController.swift
//  project
//
//  Created by Admin on 21/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//



import Foundation
import UIKit

class FourthViewController: UITableViewController{
    let airRepo = AircraftRepo();
    let flightRepo = FlightRepo();
    var total = 0.0;
    
    @IBOutlet var lblHouresHeli: [UILabel]!
    
    @IBOutlet var lblHouresAircraft: [UILabel]!
    
    @IBOutlet weak var lblTotalHoures: UILabel!
    
    
    func initData(){
        loadData(list: flightRepo.getAllFlights(type: "helicopter"),listLabel: lblHouresHeli);
        loadData(list: flightRepo.getAllFlights(type: "aircraft"),listLabel: lblHouresAircraft);
        lblTotalHoures.text = String(total);
        
    }
    
    func loadData(list: [Flight],listLabel : [UILabel]){
        
                var pic = 0.0;
        var dual = 0.0;
        var sim = 0.0;
        var instr = 0.0;
        
        for flight in list{
            pic += flight.PIC;
            dual += flight.dual;
            sim += flight.SIM;
            instr += flight.instructor;
            total += pic + dual + sim + instr;
        }

        for index in 0...4{
            let label = listLabel[index]
            
            switch index {
            case 0:
                label.text = String(pic);
                break;
            case 1:label.text = String(dual);
                 break
            case 2:label.text = String(sim);
                break;
            case 3:label.text = String(instr)
                break;
            case 4: label.text = String(pic + dual + sim + instr);
                break;
                
            default:
                label.text = "0.0";
            }
        }
 
       
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData();
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
}


