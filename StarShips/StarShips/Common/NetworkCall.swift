//
//  NetworkCall.swift

//
//  Created by Talha Ghous on 11/9/21.
//  Copyright © 2021 Talha Ghous. All rights reserved.
//

import UIKit

class NetworkCall: NSObject {
    
    static let sharedInstance = NetworkCall()
    var delegate:NetworkProtocol?
    
    func get_StarShips_Data()   {
        
        let url = BaseApi
        let objurl = URL(string: url)
        
        URLSession.shared.dataTask(with: objurl!) {(data, response, error) in
            
            do {
                
                if data != nil{
                    if  let resultJson:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary{
                        print(resultJson)
                        let obj = StarShip()
                        Director.sharedInstance.starShip_List = obj.decode_StarShip_List(data: resultJson)
                        NetworkCall.sharedInstance.delegate?.starShips_data_added!(obj: Director.sharedInstance.starShip_List)
                    }
                }else{
                    NetworkCall.sharedInstance.delegate?.starShips_data_added!(obj: nil)
                }
            } catch {
                print("Error")
                NetworkCall.sharedInstance.delegate?.starShips_data_added!(obj: nil)
            }
            }.resume()
    }// end 
    
}

@objc protocol NetworkProtocol{
    @objc optional func starShips_data_added(obj:Array<StarShip>?)
    
}
