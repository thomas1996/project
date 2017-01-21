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
    
    @IBOutlet weak var txfCallsign: UITextField!
    @IBOutlet weak var txfType: UITextField!
    
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround();
        super.viewDidLoad()

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
}
