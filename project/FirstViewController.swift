//
//  FirstViewController.swift
//  project
//
//  Created by Admin on 29/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class FirstViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate,UINavigationControllerDelegate,UITextFieldDelegate{
    
    var option = AircraftRepo();
    var repo = FlightRepo();
    
    
    
    
    
    
    @IBOutlet weak var txfComments: UITextField!
    @IBOutlet weak var txfRoute: UITextField!
    @IBOutlet weak var txfDate: UITextField!
    @IBOutlet weak var txfPic: UITextField!
    @IBOutlet weak var txfdual: UITextField!
    @IBOutlet weak var txfSim: UITextField!
    @IBOutlet weak var txfInstructor: UITextField!
    @IBOutlet weak var txfAircraft: UITextField!
    @IBOutlet weak var lblError: UILabel!
   
   
  
  
    @IBAction func changeDate(_ sender: UITextField) {
        let datePicker : UIDatePicker = UIDatePicker()
        
        datePicker.datePickerMode = UIDatePickerMode.date;
        txfDate.inputView = datePicker;
        sender.inputView = datePicker;
        datePicker.addTarget(self, action: #selector(FirstViewController.handleDatePicker), for: UIControlEvents.valueChanged)

    }
 
    //own methods
    
        func handleDatePicker(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        txfDate.text = dateFormatter.string(from: sender.date)
    }
  
    //override functions
 
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.delegate = self;
        if textField == txfDate {
            txfAircraft.becomeFirstResponder();
        };if textField == txfAircraft {
            txfComments.becomeFirstResponder();
        };if textField == txfComments {
            txfRoute.becomeFirstResponder();
        };if textField == txfRoute {
            txfPic.becomeFirstResponder();
        };if textField == txfPic {
            txfdual.becomeFirstResponder();
        };if textField == txfdual {
            txfSim.becomeFirstResponder();
        };if textField == txfSim {
            txfInstructor.becomeFirstResponder();
            
        return true
    }
        return false;
    }
    


    
   
    override func viewDidLoad() {
        super.viewDidLoad();
        lblError.text = "";
       
        self.hideKeyboardWhenTappedAround();
        //set date today in datepicker
        
        let date = NSDate();
        let formatter = DateFormatter();
        formatter.dateFormat = "dd-MM-YYYY";
         txfDate.text = formatter.string(from: date as Date)
        //initialise the datepicker
        
        let pickerView = UIPickerView();
        pickerView.delegate = self;
        pickerView.dataSource = self;
        //initialise the imagepicker
        
        
    
    
        //initialise the aircraft picker
        let option = AircraftRepo();
        txfAircraft.inputView = pickerView;
        if(option.getList().count > 0)
        {txfAircraft.text = option.getList()[0].callsign;
        }else{
            txfAircraft.text = "Add an aicraft"
        }
        

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

