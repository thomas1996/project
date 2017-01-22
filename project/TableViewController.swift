//
//  TableViewController.swift
//  project
//
//  Created by Admin on 21/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

class TableViewController : UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    let imagePicker = UIImagePickerController();
    let documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
    private var contView: FirstViewController!
    let tempImageName = "temp_image.jpg"
    var imageUrl = NSURL();
    
    var option = AircraftRepo();
    var repo = FlightRepo();
    


    
    
    @IBOutlet weak var stackImage: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    

    @IBAction func btnNew(_ sender: UIBarButtonItem) {
        //clear errors
        
        contView.lblError.text = "";
        //string to date
        
        let formatter = DateFormatter();
        formatter.dateFormat = "dd-MM-yyyy";
        let dateFlight = formatter.date(from: contView.txfDate.text!);
        
        //checking on emtpy textfields
        if ((contView.txfRoute.text?.isEmpty)! || (contView.txfRoute.text?.trimmingCharacters(in: .whitespaces).isEmpty)!)
        {
            contView.txfRoute.text = "No route";
        }
        if ((contView.txfComments.text?.isEmpty)! || (contView.txfComments.text?.trimmingCharacters(in: .whitespaces).isEmpty)!)
        {
            contView.txfComments.text = "No comment";
        }
        // checking on emty numbers
        
        let pic = checkEmty(value:(NumberFormatter().number(from: contView.txfPic.text!)?.doubleValue)!);
        let dual = checkEmty(value:(NumberFormatter().number(from: contView.txfdual.text!)?.doubleValue)!);
        let sim = checkEmty(value:(NumberFormatter().number(from: contView.txfSim.text!)?.doubleValue)!);
        let instructor = checkEmty(value: NumberFormatter().number(from: contView.txfInstructor.text!)?.doubleValue);
        let aircraft = option.getAircraft(callsign: contView.txfAircraft.text!);
        
        let total = pic + dual + sim + instructor;
        if(total > 0 )
        {
            let newFlight = Flight(date: dateFlight!, aircraft: aircraft!, route: contView.txfRoute.text!, comment: contView.txfComments.text!, PIC: pic, dual: dual, Sim: sim, instructor: instructor,  photo: UIImage())
            
            repo.addFlight(flight: newFlight);
            reset();
        }
        else
        {
            contView.lblError.text = "Please fill at least 1 min of flightime ";
        }
        
    }
    @IBAction func btnReset(_ sender: UIBarButtonItem) {
        
        reset();
    }
    @IBAction func btnAddPhoto(_ sender: UIBarButtonItem) {
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = .photoLibrary;
        
    
    }
    @IBAction func dismiss(sender: AnyObject){
        
        navigationController?.popViewController(animated: true)
    }


    
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

    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destination as? FirstViewController, segue.identifier == "Embedded" {
            
            self.contView = vc;
        }
    }
    func reset(){
        let date = NSDate();
        let formatter = DateFormatter();
        formatter.dateFormat = "dd-MM-YYYY";
        contView.txfDate.text = formatter.string(from: date as Date)
        
        contView.txfComments.text = ""
        contView.txfRoute.text = ""
        contView.txfPic.text = ""
        contView.txfSim.text = ""
        contView.txfdual.text = ""
        contView.txfInstructor.text = ""
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true,completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        
        
        stackImage.isHidden = false;
        dismiss(animated: true,completion:nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        
        stackImage.isHidden = true;
        
        
        //initialise the imagepicker
        
        imagePicker.delegate = self
        
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    




    
    
    
    
    
}
