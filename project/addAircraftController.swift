//
//  addAircraftController.swift
//  project
//
//  Created by Admin on 21/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

class AddAircraftController : UIViewController{
    
    var repo = AircraftRepo();
    
    @IBOutlet weak var txfCallsign: UITextField!
    @IBOutlet weak var txfType: UITextField!
    @IBOutlet weak var btnHeli: UIButton!
    
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnAir: UIButton!
    
    @IBAction func btnHeli(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        sender.isHighlighted = !sender.isHighlighted;
        sender.setBackgroundImage(#imageLiteral(resourceName: "Helicopter checked"), for: UIControlState.selected);
        
        btnAir.isSelected = false;

    }
    @IBAction func btnAir(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        sender.isHighlighted = !sender.isHighlighted;
        sender.setBackgroundImage(#imageLiteral(resourceName: "Airplane checked"), for: UIControlState.selected);
        
        btnHeli.isSelected = false;
        
    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if(txfCallsign.text?.isEmpty)!{
            lblError.text = "please fill in a callsign";
        }else if(txfType.text?.isEmpty)!{
            lblError.text = "pleqse fill in a type";
        }else if(!btnHeli.isSelected && !btnAir.isSelected){
            lblError.text = "please select a type";
        }else{
            if(btnHeli.isSelected){
            repo.addAircraft(aircraft: Aircraft(callsign: txfCallsign.text!, type: txfType.text!, origin: "helicopter"));
            }else{
                repo.addAircraft(aircraft: Aircraft(callsign: txfCallsign.text!, type: txfType.text!, origin: "aircraft"));
            }
            
            _ = navigationController?.popViewController(animated: true);
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround();
        super.viewDidLoad()

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
}
