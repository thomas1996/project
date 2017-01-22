//
//  SecondViewController.swift
//  project
//
//  Created by Admin on 29/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
     var repo = AircraftRepo()
    lazy var list = AircraftRepo().getList();

   
    
    @IBOutlet weak var tbltable: UITableView!

    @IBAction func btnNew(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "new aircraft", message: "fill out all the fields to add a new aircraft", preferredStyle: UIAlertControllerStyle.alert);
        
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.addNewAircraft();
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
       self.present(alert, animated: true, completion: nil)
    }


    
    func addNewAircraft(){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
                switch list[indexPath.item].origin.lowercased() {
        case "aircraft":cell.imageView?.image = #imageLiteral(resourceName: "Airplane ");
        case "helicopter":cell.imageView?.image = #imageLiteral(resourceName: "helicopter");
        default:
            cell.imageView?.image = #imageLiteral(resourceName: "helicopter");
        }
        
        cell.textLabel?.text = list[indexPath.item].callsign + " type: " + repo.getList()[indexPath.item].type;
        

        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            tbltable.deleteRows(at: [indexPath], with: .fade);
            _ = repo.deleteAircraft(aircraft: list[indexPath.item]);
            }
    }
    
    

    override func viewDidLoad() {
        //let repo = AircraftRepo();
        tbltable.reloadData();

        super.viewDidLoad()
        tbltable.dataSource = self;
        tbltable.delegate = self;
        tbltable.reloadData()
       // self.view.reloadInputViews();
       // tbltable.beginUpdates();
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        tbltable.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

