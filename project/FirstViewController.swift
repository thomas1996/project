//
//  FirstViewController.swift
//  project
//
//  Created by Admin on 29/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    
    var option = AircraftRepo()
    
    
    @IBOutlet weak var txfComments: UITextField!
    @IBOutlet weak var txfRoute: UITextField!
    @IBOutlet weak var txfDate: UITextField!
    @IBOutlet weak var txfPic: UITextField!
    @IBOutlet weak var txfdual: UITextField!
    @IBOutlet weak var txfSim: UITextField!
    @IBOutlet weak var txfInstructor: UITextField!
    @IBOutlet weak var txfAircraft: UITextField!
    
  
  
    @IBAction func changeDate(_ sender: UITextField) {
        let datePicker : UIDatePicker = UIDatePicker()
        
        datePicker.datePickerMode = UIDatePickerMode.date;
        txfDate.inputView = datePicker;
        sender.inputView = datePicker;
        datePicker.addTarget(self, action: #selector(FirstViewController.handleDatePicker), for: UIControlEvents.valueChanged)

    }
    
        func handleDatePicker(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        txfDate.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func btnNew(_ sender: UIBarButtonItem) {
        
    }
  
    
    
    @IBAction func btnReset(_ sender: UIBarButtonItem) {
        let date = NSDate();
        let formatter = DateFormatter();
        formatter.dateFormat = "dd-MM-YYYY";
        txfDate.text = formatter.string(from: date as Date)
        
        txfComments.text = ""
        txfRoute.text = ""
        txfPic.text = ""
        txfSim.text = ""
        txfdual.text = ""
        txfInstructor.text = ""
        
        
    }
    @IBAction func btnAddPhoto(_ sender: UIBarButtonItem) {
        
    }
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        
        return option.getList().count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return option.getList()[row].callsign
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txfAircraft.text = option.getList()[row].callsign
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        let date = NSDate();
        let formatter = DateFormatter();
        
        formatter.dateFormat = "dd-MM-YYYY";
        let pickerView = UIPickerView();
        pickerView.delegate = self;
        pickerView.dataSource = self;
    
       let option = AircraftRepo();
      
        txfAircraft.inputView = pickerView;
        txfAircraft.text = option.getList()[1].callsign;
        
        
        
        
        txfDate.text = formatter.string(from: date as Date)
        // Do any additional setup after loading the view, typically from a nib.
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

