//
//  StarShipTableViewController.swift
//  StarShips
//
//  Created by Talha Ghous on 10/9/21.
//  Copyright © 2021 Talha Ghous. All rights reserved.
//

import UIKit

class StarShipTableViewController: UITableViewController ,NetworkProtocol, UIGestureRecognizerDelegate{

    var starShip_List:Array<StarShip> = Array()
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateTableView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ApplicationName
        
        let nib = UINib.init(nibName: "StarShipTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "listStarShip")
        
        if Director.sharedInstance.loadStarShips() {
            self.starShip_List = Director.sharedInstance.starShip_List
        }else{
            NetworkCall.sharedInstance.delegate = self
            NetworkCall.sharedInstance.get_StarShips_Data()
            
            activityIndicator.center =  CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
            self.view.addSubview(activityIndicator)
            activityIndicator.color = UIColor.blue
            activityIndicator.hidesWhenStopped = true
            
            activityIndicator.startAnimating()
        }
        
        //Long Press
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGesture.minimumPressDuration = 0.5
        self.tableView.addGestureRecognizer(longPressGesture)

    }
    
    @objc func handleLongPress(longPressGesture: UILongPressGestureRecognizer) {
        let p = longPressGesture.location(in: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: p)
        if indexPath == nil {
            print("Long press on table view, not row.")
        } else if longPressGesture.state == UIGestureRecognizer.State.began {
            print("Long press on row, at \(indexPath!.row)")
            if(Director.sharedInstance.starShip_List[(indexPath?.row)!].isFavourite!){
                // Ship is already favourite
                Director.sharedInstance.starShip_List[(indexPath?.row)!].isFavourite = false
                self.updateTableView()
            }else{
                // ship is not a favourite
                Director.sharedInstance.starShip_List[(indexPath?.row)!].isFavourite = true
                self.updateTableView()
            }
        }
    }
    
    func updateTableView()  {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
//     MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.starShip_List.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:StarShipTableViewCell = tableView.dequeueReusableCell(withIdentifier: "listStarShip", for: indexPath) as! StarShipTableViewCell
        cell.starShipName.text =  self.starShip_List[indexPath.row].name!
        cell.starShipModel.text = "MGLT:  " + self.starShip_List[indexPath.row].MGLT!
        cell.starShipMenufacturer.text = "Ship Length:  " + self.starShip_List[indexPath.row].length!
        
        if self.starShip_List[indexPath.row].isFavourite! {
            cell.contentView.backgroundColor =  UIColor.lightGray
        }else{
            cell.contentView.backgroundColor =  UIColor.white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "StarShipDetailsTableViewController") as! StarShipDetailsTableViewController
        myVC.set_starship(index: indexPath.row)
        self.navigationController?.pushViewController(myVC, animated: true)
    }
    
    
//     MARK: - Network Protocol Methods
    
    func starShips_data_added(obj: Array<StarShip>?) {
        if obj == nil {
            self.activityIndicator.stopAnimating()
            self.showMessage(title: "Error", message: "There is a problem in your connection, Please try again later!")
            
        }else{
            self.starShip_List = obj!
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
            Director.sharedInstance.saveStarShips(starShipList: obj!)
            self.showMessage(title: "Welcome", message: "Long press to select favourite.")
        }

    }
    func showMessage(title:String, message:String)  {
        let alert = UIAlertController(title: "Welcome", message: "Long press to select favourite.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
 

}
