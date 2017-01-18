//
//  FirstViewController.swift
//  project
//
//  Created by Admin on 29/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txfComments: UITextField!
    @IBOutlet weak var txfRoute: UITextField!
    @IBOutlet weak var txfDate: UITextField!
    
    @IBAction func date(sender: UITextField) {
        let datePicker : UIDatePicker = UIDatePicker()
        
        
        datePicker.datePickerMode = UIDatePickerMode.date;
        sender.inputView = datePicker;
        datePicker.addTarget(self, action: Selector(("handleDatePicker:")), for: UIControlEvents.valueChanged)

    }
    
    func handleDatePicker(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        txfDate.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func btnNew(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func btnAircraft(_ sender: UIButton) {
        
    }
    
    @IBOutlet var txfHoures: [UITextField]!
    
    
    @IBAction func btnReset(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func btnAddPhoto(_ sender: UIBarButtonItem) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate();
        let formatter = DateFormatter();
        
        formatter.dateFormat = "dd-mm-YYYY";
        
        
        txfDate.text = formatter.string(from: date as Date)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

