//
//  StarShip.swift
//  StarShips
//
//  Created by Talha Ghous on 10/9/21.
//  Copyright © 2021 Talha Ghous. All rights reserved.
//

import UIKit

class StarShip: NSObject, NSCoding{
    
    var name:String?
    var model:String?
    var manufacturer:String?
    var cost_in_credits:String?
    var length:String?
    var max_atmosphering_speed:String?
    var crew:String?
    var passengers:String?
    var cargo_capacity:String?
    var consumables:String?
    var hyperdrive_rating:String?
    var MGLT:String?
    var starship_class:String?
    var isFavourite:Bool?
    
    struct StarShipKey {
        static let name = "name";
        static let model = "model";
        static let manufacturer = "manufacturer";
        static let cost_in_credits = "cost_in_credits";
        static let length = "length";
        static let max_atmosphering_speed = "max_atmosphering_speed";
        static let crew = "crew";
        static let passengers = "passengers";
        static let cargo_capacity = "cargo_capacity";
        static let consumables = "consumables";
        static let hyperdrive_rating = "hyperdrive_rating";
        static let MGLT = "MGLT";
        static let starship_class = "starship_class";
        static let isFavourite = "isFavourite";
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: StarShipKey.name);
        aCoder.encode(model, forKey: StarShipKey.model);
        aCoder.encode(manufacturer, forKey: StarShipKey.manufacturer);
        aCoder.encode(cost_in_credits, forKey: StarShipKey.cost_in_credits);
        aCoder.encode(length, forKey: StarShipKey.length);
        aCoder.encode(max_atmosphering_speed, forKey: StarShipKey.max_atmosphering_speed);
        aCoder.encode(crew, forKey: StarShipKey.crew);
        aCoder.encode(passengers, forKey: StarShipKey.passengers);
        aCoder.encode(cargo_capacity, forKey: StarShipKey.cargo_capacity);
        aCoder.encode(consumables, forKey: StarShipKey.consumables);
        aCoder.encode(hyperdrive_rating, forKey: StarShipKey.hyperdrive_rating);
        aCoder.encode(MGLT, forKey: StarShipKey.MGLT);
        aCoder.encode(starship_class, forKey: StarShipKey.starship_class);
        aCoder.encode(isFavourite, forKey: StarShipKey.isFavourite);
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: StarShipKey.name) as? String;
        let model = aDecoder.decodeObject(forKey: StarShipKey.model) as? String;
        let manufacturer = aDecoder.decodeObject(forKey: StarShipKey.manufacturer) as? String;
        let cost_in_credits = aDecoder.decodeObject(forKey: StarShipKey.cost_in_credits) as? String;
        let length = aDecoder.decodeObject(forKey: StarShipKey.length) as? String;
        let max_atmosphering_speed = aDecoder.decodeObject(forKey: StarShipKey.max_atmosphering_speed) as? String;
        let crew = aDecoder.decodeObject(forKey: StarShipKey.crew) as? String;
        let passengers = aDecoder.decodeObject(forKey: StarShipKey.passengers) as? String;
        let cargo_capacity = aDecoder.decodeObject(forKey: StarShipKey.cargo_capacity) as? String;
        let consumables = aDecoder.decodeObject(forKey: StarShipKey.consumables) as? String;
        let hyperdrive_rating = aDecoder.decodeObject(forKey: StarShipKey.hyperdrive_rating) as? String;
        let MGLT = aDecoder.decodeObject(forKey: StarShipKey.MGLT) as? String;
        let starship_class = aDecoder.decodeObject(forKey: StarShipKey.starship_class) as? String;
        let isFavourite = aDecoder.decodeObject(forKey: StarShipKey.isFavourite) as? Bool;
       
        self.init(name: name, model: model, manufacturer: manufacturer, cost_in_credits: cost_in_credits, length: length, max_atmosphering_speed: max_atmosphering_speed, crew: crew, passengers: passengers, cargo_capacity: cargo_capacity, consumables: consumables, hyperdrive_rating: hyperdrive_rating, MGLT: MGLT, starship_class: starship_class, isFavourite: isFavourite)
    }
    
    override init() {
       
    }
    init(name:String?, model:String?, manufacturer:String?, cost_in_credits:String?, length:String?, max_atmosphering_speed:String?, crew:String?, passengers:String?, cargo_capacity:String?, consumables:String?, hyperdrive_rating:String?, MGLT:String?, starship_class:String?, isFavourite:Bool?) {
       
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.cost_in_credits = cost_in_credits
        self.length = length
        self.max_atmosphering_speed = max_atmosphering_speed
        self.crew = crew
        self.passengers = passengers
        self.cargo_capacity = cargo_capacity
        self.consumables = consumables
        self.hyperdrive_rating = hyperdrive_rating
        self.MGLT = MGLT
        self.starship_class = starship_class
        self.isFavourite = isFavourite
    }
    
    
    
    func decode_StarShip(shipData:NSDictionary) -> StarShip {
        let starShip:StarShip = StarShip()
        starShip.isFavourite = false
        
        if let _:String = shipData.value(forKey: "name") as? String {
            starShip.name = shipData.value(forKey: "name") as? String
        }
        if let _:String = shipData.value(forKey: "model") as? String {
            starShip.model = shipData.value(forKey: "model") as? String
        }
        if let _:String = shipData.value(forKey: "manufacturer") as? String {
            starShip.manufacturer = shipData.value(forKey: "manufacturer") as? String
        }
        if let _:String = shipData.value(forKey: "cost_in_credits") as? String {
            starShip.cost_in_credits = shipData.value(forKey: "cost_in_credits") as? String
        }
        if let _:String = shipData.value(forKey: "length") as? String {
            starShip.length = shipData.value(forKey: "length") as? String
        }
        if let _:String = shipData.value(forKey: "max_atmosphering_speed") as? String {
            starShip.max_atmosphering_speed = shipData.value(forKey: "max_atmosphering_speed") as? String
        }
        if let _:String = shipData.value(forKey: "crew") as? String {
            starShip.crew = shipData.value(forKey: "crew") as? String
        }
        if let _:String = shipData.value(forKey: "passengers") as? String {
            starShip.passengers = shipData.value(forKey: "passengers") as? String
        }
        if let _:String = shipData.value(forKey: "cargo_capacity") as? String {
            starShip.cargo_capacity = shipData.value(forKey: "cargo_capacity") as? String
        }
        if let _:String = shipData.value(forKey: "consumables") as? String {
            starShip.consumables = shipData.value(forKey: "consumables") as? String
        }
        if let _:String = shipData.value(forKey: "hyperdrive_rating") as? String {
            starShip.hyperdrive_rating = shipData.value(forKey: "hyperdrive_rating") as? String
        }
        if let _:String = shipData.value(forKey: "MGLT") as? String {
            starShip.MGLT = (shipData.value(forKey: "MGLT") as! String)
        }
        if let _:String = shipData.value(forKey: "starship_class") as? String {
            starShip.starship_class = (shipData.value(forKey: "starship_class") as! String)
        }
        
        return starShip
    }//decodeStarShip ends
    
    
    func decode_StarShip_List(data:NSDictionary) -> Array<StarShip>{
        
        var starShip_List:Array<StarShip> = Array()
        
        if let _:Array<NSDictionary> = data.value(forKey: "results") as? Array<NSDictionary> {
            let array_Dic = data.value(forKey: "results") as? Array<NSDictionary>
            
            for dic_obj in array_Dic! {
            starShip_List.append(self.decode_StarShip(shipData: dic_obj))
            }
        }
        return starShip_List
//        print(starShip_List)
    }//decode_StarShip_List ends
}
