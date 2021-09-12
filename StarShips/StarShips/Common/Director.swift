//
//  Director.swift
//  StarShips
//
//  Created by Talha Ghous on 11/9/21.
//  Copyright © 2021 Talha Ghous. All rights reserved.
//

import UIKit

class Director: NSObject {
    static let sharedInstance = Director()
    var starShip_List:Array<StarShip> = Array()
    
    public func saveStarShips(starShipList:Array<StarShip>) -> Bool {
        if saveFile(filename:  FILENAME, k: starShipList) {
            print("Categories updated successfully!");
            return true;
        }
        return false;
    }
    
    public func loadStarShips() -> Bool {
        let c = loadFile(filename: FILENAME) as Array<StarShip>?;
        if (c != nil) {
            self.starShip_List = c!;
            return true;
        }
        return false;
    }
    
    /**
     *
     * @return the path as URL
     * */
    public func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first;
        return path!;
    }
    
    /**
     * Saves file in binary format.
     *
     * @param filename as String
     * @param <K> Generic type.
     * @return true if file is saved successfully, false otherwise.
     * */
    public func saveFile<K>(filename: String, k: K) -> Bool {

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: k, requiringSecureCoding: false)
            let fullPath = getDocumentsDirectory().appendingPathComponent(filename);
            try data.write(to: fullPath);
            print("File: [" + filename + "] saved successfully!");
            return true;
        } catch {
            print("Error while saving file: [" + filename + "]");
        }
        return false;
    }
    
    /**
     * Loades the saved binary object file.
     *
     * @param the filename as String
     * @return loaded object <T>
     * */
    public func loadFile<T>(filename: String) -> T? {
        let fullPath = getDocumentsDirectory().appendingPathComponent(filename);
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: fullPath.path) as? T {
            return loaded;
        }
        
        return nil;
    }
    
}
