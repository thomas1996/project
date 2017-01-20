//
//  ThirdViewController.swift
//  project
//
//  Created by Admin on 20/01/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit


class ThirdViewController : UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    let repo = FlightRepo();
    
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
        cell.textLabel?.text = date + " " + repo.getList()[indexPath.item].aircraft.callsign + "(" + time + "h)";
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTable.dataSource = self;
        tblTable.delegate = self;
        tblTable.reloadData();
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

