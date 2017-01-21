//
//  SecondViewController.swift
//  project
//
//  Created by Admin on 29/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    let repo = AircraftRepo();
   
    
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
        return repo.getList().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        /*
        let image = UIImageView();
        let stack = UIStackView();
        let callsign = UILabel();
        let type = UILabel();
        
        callsign.text = repo.getList()[indexPath.item].callsign;
        type.text = repo.getList()[indexPath.item].type;
        stack.axis = .horizontal;
        
        switch repo.getList()[indexPath.item].origin.lowercased() {
            case "aircraft":image.image = #imageLiteral(resourceName: "aircraft");
            case "helicopter":image.image = #imageLiteral(resourceName: "helicopter");
        default:
            image.image = #imageLiteral(resourceName: "helicopter");
        }
        
        
        
        stack.addArrangedSubview(image);
        stack.addArrangedSubview(callsign);
        stack.addArrangedSubview(type)
        //cell.textLabel?.text =
        cell.addSubview(stack);
 */
        
        switch repo.getList()[indexPath.item].origin.lowercased() {
        case "aircraft":cell.imageView?.image = #imageLiteral(resourceName: "aircraft");
        case "helicopter":cell.imageView?.image = #imageLiteral(resourceName: "helicopter");
        default:
            cell.imageView?.image = #imageLiteral(resourceName: "helicopter");
        }
        
        cell.textLabel?.text = repo.getList()[indexPath.item].callsign + " type: " + repo.getList()[indexPath.item].type;
        

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tbltable.dataSource = self;
        tbltable.delegate = self;
        tbltable.reloadData();
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

