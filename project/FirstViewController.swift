//
//  FirstViewController.swift
//  project
//
//  Created by Admin on 29/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var option = AircraftRepo();
    var repo = FlightRepo();
    let imagePicker = UIImagePickerController();
    
    
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
    
    
    @IBAction func btnNew(_ sender: UIBarButtonItem) {
        //clear errors
        
        lblError.text = "";
        //string to date
        
        let formatter = DateFormatter();
        formatter.dateFormat = "dd-MM-yyyy";
        let dateFlight = formatter.date(from: txfDate.text!);
        
        //checking on emtpy textfields
        if ((txfRoute.text?.isEmpty)! || (txfRoute.text?.trimmingCharacters(in: .whitespaces).isEmpty)!)
        {
            txfRoute.text = "No route";
        }
        if ((txfComments.text?.isEmpty)! || (txfComments.text?.trimmingCharacters(in: .whitespaces).isEmpty)!)
        {
            txfComments.text = "No comment";
        }
        // checking on emty numbers
        
        let pic = checkEmty(value:(NumberFormatter().number(from: txfPic.text!)?.doubleValue)!);
        let dual = checkEmty(value:(NumberFormatter().number(from: txfdual.text!)?.doubleValue)!);
        let sim = checkEmty(value:(NumberFormatter().number(from: txfSim.text!)?.doubleValue)!);
        let instructor = checkEmty(value: NumberFormatter().number(from: txfInstructor.text!)?.doubleValue);
        let aircraft = option.getAircraft(callsign: txfAircraft.text!);
        
        let total = pic + dual + sim + instructor;
        if(total > 0 )
        {
          let newFlight = Flight(date: dateFlight!, aircraft: aircraft!, route: txfRoute.text!, comment: txfComments.text!, PIC: pic, dual: dual, Sim: sim, instructor: instructor, total: total, photo: UIImage())
            
            repo.addFlight(flight: newFlight);
            reset();
        }
        else
        {
         lblError.text = "Please fill at least 1 min of flightime ";
        }
           
    }
  
    
    
    @IBAction func btnReset(_ sender: UIBarButtonItem) {
        
        reset();
    }
    @IBAction func btnAddPhoto(_ sender: UIBarButtonItem) {
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = .photoLibrary;
        
    }
    
    
    //own methods
    
    func checkEmty(value:Double?) ->Double
    {
        var output:Double
        if value == nil
        {
            output = 0.0;
        }
        else{
            output = value!;
        }
        return output;
    }
    func handleDatePicker(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        txfDate.text = dateFormatter.string(from: sender.date)
    }
    func reset(){
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
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
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
        
        imagePicker.delegate = self
    
        //initialise the aircraft picker
        let option = AircraftRepo();
        txfAircraft.inputView = pickerView;
        txfAircraft.text = option.getList()[1].callsign;

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

