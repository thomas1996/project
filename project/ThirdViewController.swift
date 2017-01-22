//
//  ThirdViewController.swift
//  project
//
//  Created by Admin on 20/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CloudKit

class ThirdViewController : UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    let repo = FlightRepo();
    var flights = [Flight]();
    
    @IBOutlet weak var tblTable: UITableView!
    
    @IBAction func btnEdit(_ sender: UIBarButtonItem) {
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.getList().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
        let formatter = DateFormatter();
        formatter.dateFormat = "dd/MM/YYYY";
        let date = formatter.string(from: repo.getList()[indexPath.item].date);
        
        let time = String(repo.getList()[indexPath.item].total);
        cell.textLabel?.text = date + " " + repo.getList()[indexPath.item].aircraft?.callsign + "(" + time + "h)";
        
        
        return cell
    }
    
    private func configureView(){
    //    let fetchingRecentsOperation = BlockOperation();
        let semaphore = DispatchSemaphore(value: 0);
        
        repo.fetchFlights(number: 10, flightCompletion: {(flight)-> Void in
            self.flights.append(flight);
            self.view.reloadInputViews();
        },completion: { (flights,succes) -> Void in
            self.flights = flights;
            self.view.reloadInputViews();
        })
        
      //  semaphore.wait(timeout: dispatch_time(DISPATCH_TIME_FOREVER));
            
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTable.dataSource = self;
        tblTable.delegate = self;
        tblTable.reloadData();
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

