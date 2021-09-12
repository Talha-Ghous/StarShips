//
//  StarShipDetailsTableViewController.swift
//  StarShips
//
//  Created by Talha Ghous on 11/9/21.
//  Copyright © 2021 Talha Ghous. All rights reserved.
//

import UIKit

class StarShipDetailsTableViewController: UITableViewController {

    var shipName:String!
    var isFavourite:Bool!
    var index = 0
    var shipDetailsArray:Array<String>!
    var shippropertiesArray:Array<String>!
    
    var favBtn:UIButton =  UIButton(type: .custom)
    
    func set_starship(index:Int)  {
        self.index = index
        let obj = Director.sharedInstance.starShip_List[index]
        self.shipName = obj.name!
        self.isFavourite = obj.isFavourite
        self.shipDetailsArray = Array()
        self.shipDetailsArray.append(obj.model!)
        self.shipDetailsArray.append(obj.manufacturer!)
        self.shipDetailsArray.append(obj.cost_in_credits!)
        self.shipDetailsArray.append(obj.length!)
        self.shipDetailsArray.append(obj.max_atmosphering_speed!)
        self.shipDetailsArray.append(obj.crew!)
        self.shipDetailsArray.append(obj.passengers!)
        self.shipDetailsArray.append(obj.cargo_capacity!)
        self.shipDetailsArray.append(obj.consumables!)
        self.shipDetailsArray.append(obj.hyperdrive_rating!)
        self.shipDetailsArray.append(obj.MGLT!)
        self.shipDetailsArray.append(obj.starship_class!)

        self.shippropertiesArray = Array()
        self.shippropertiesArray.append("Model")
        self.shippropertiesArray.append("Manufacturer")
        self.shippropertiesArray.append("Cost in Credits")
        self.shippropertiesArray.append("Length")
        self.shippropertiesArray.append("Max Atmosphering Speed")
        self.shippropertiesArray.append("Crew")
        self.shippropertiesArray.append("Passengers")
        self.shippropertiesArray.append("Cargo Capacity")
        self.shippropertiesArray.append("Consumables")
        self.shippropertiesArray.append("Hyperdrive Rating")
        self.shippropertiesArray.append("MGLT")
        self.shippropertiesArray.append("Starship Class")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.shipName
        
        if self.isFavourite {
            self.setUpBarButton(imageName: "heart_Selected")
        }else{
            self.setUpBarButton(imageName: "heart")
        }
        
    }
    
    func setUpBarButton(imageName:String)  {
      
        favBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        favBtn.setImage(UIImage(named:imageName), for: .normal)
        favBtn.addTarget(self, action: #selector(favouriteTapped), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: favBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        
        self.navigationItem.rightBarButtonItem = menuBarItem
    }
    
    @objc func favouriteTapped()  {
        if self.isFavourite {
            favBtn.setImage(UIImage(named:"heart"), for: .normal)
            self.isFavourite = false
            Director.sharedInstance.starShip_List[self.index].isFavourite = false
            
        }else{
            favBtn.setImage(UIImage(named:"heart_Selected"), for: .normal)
            self.isFavourite = true
            Director.sharedInstance.starShip_List[self.index].isFavourite = true
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.shipDetailsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailedStarSip", for: indexPath)

        // Configure the cell...
        
        cell.detailTextLabel?.text = self.shipDetailsArray[indexPath.row]
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.text = self.shippropertiesArray[indexPath.row]
        

        return cell
    }

}
