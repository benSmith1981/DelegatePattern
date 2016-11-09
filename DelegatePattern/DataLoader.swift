//
//  DataLoader.swift
//  DelegatePattern
//
//  Created by Ben Smith on 09/11/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import Foundation
class DataLoader: NSObject {
    var arriveAtBarMessage: Messages!
    var drinkMoreBeerMessage: Messages!
    var exitCabMessage: Messages!
    var callCabMessage: Messages!
    //Singleton
    static let sharedInstance = DataLoader()
    private override init() {}
    
    func loadMessages() {
        arriveAtBarMessage = Messages.init(message: "I am cooking dinner come home soon", image: #imageLiteral(resourceName: "dinner"))
        drinkMoreBeerMessage = Messages.init(message: "Stop drinking!", image: #imageLiteral(resourceName: "beer"))
        exitCabMessage = Messages.init(message: "Dinner is cold", image: #imageLiteral(resourceName: "exitCab"))
        callCabMessage = Messages.init(message: "Hurry dinner is ready", image: #imageLiteral(resourceName: "callCab"))
        
    }
    
}
