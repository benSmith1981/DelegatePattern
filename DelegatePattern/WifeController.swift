//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Ben Smith on 07/11/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import UIKit

protocol CallWifeDelegate: class {
    func didArriveAtBar()
    func didExitCab()
    func didDrinkMoreBeer()
    func didCallCab()

}

class WifeController: UIViewController, CallWifeDelegate {
    @IBOutlet weak var goingOutImage: UIImageView!
    @IBOutlet weak var WifeAction: UITextField!
    @IBOutlet weak var goingOutView: GoingOut!
    
    var arriveAtBarMessage: Messages?
    var drinkMoreBeerMessage: Messages?
    var exitCabMessage: Messages?
    var callCabMessage: Messages?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register to receive notification data
        NotificationCenter.default.addObserver(self, selector: #selector(WifeController.notifyObservers), name:  NSNotification.Name(rawValue: "messagesLoaded"), object: nil)

        //call model to load data
        DataLoader.sharedInstance.loadMessages()
        goingOutView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func didArriveAtBar(){
        if let arriveAtBarMessage = arriveAtBarMessage {
            WifeAction.text = arriveAtBarMessage.message
            goingOutImage.image = arriveAtBarMessage.image
            
        }
    }
    
    func didDrinkMoreBeer(){
        if let drinkMoreBeerMessage = drinkMoreBeerMessage {
            WifeAction.text = drinkMoreBeerMessage.message
            goingOutImage.image = drinkMoreBeerMessage.image
        }
    }
    
    func didExitCab(){
        if let exitCabMessage = exitCabMessage {
            WifeAction.text = exitCabMessage.message
            goingOutImage.image = exitCabMessage.image
        }
    }
    
    func didCallCab(){
        if let callCabMessage = callCabMessage {
            WifeAction.text = callCabMessage.message
            goingOutImage.image = callCabMessage.image
            
        }
    }
    
    func notifyObservers(notification : NSNotification) {
        let userInfo = notification.userInfo as! Dictionary<String,Messages?>
        if let messageArrive = userInfo[ObserverKeys.didArriveAtBar.rawValue]! as Messages? {
            arriveAtBarMessage = messageArrive
        }
        
        if let drinkMore = userInfo[ObserverKeys.didDrinkMoreBeer.rawValue]! as Messages? {
            drinkMoreBeerMessage = drinkMore
        }
        
        if let exitCab = userInfo[ObserverKeys.didExitCab.rawValue]! as Messages? {
            exitCabMessage = exitCab
        }

        if let callCab = userInfo[ObserverKeys.didCallCab.rawValue]! as Messages? {
            callCabMessage = callCab
        }

    }
}

