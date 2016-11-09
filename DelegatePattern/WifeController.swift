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
    
    var arriveAtBarMessage: Messages!
    var drinkMoreBeerMessage: Messages!
    var exitCabMessage: Messages!
    var callCabMessage: Messages!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define identifier
        let notificationName = Notification.Name("NotificationIdentifier")
        // Register to receive notification data
        NotificationCenter.default.addObserver(self, selector: #selector(WifeController.notifyObservers), name:  NSNotification.Name(rawValue: "arriveBar"), object: nil)

        //call model to load data
        DataLoader.sharedInstance.loadMessages()
        goingOutView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        //goingOutView.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func didArriveAtBar(){
        if let arriveAtBarMessage = DataLoader.sharedInstance.arriveAtBarMessage {
            WifeAction.text = arriveAtBarMessage.message
            goingOutImage.image = arriveAtBarMessage.image
            NotificationCenter.default.post(name: Notification.Name(rawValue: "arriveBar"), object: self)
        }
    }
    
    func didDrinkMoreBeer(){
        if let drinkMoreBeerMessage = DataLoader.sharedInstance.drinkMoreBeerMessage {
            WifeAction.text = drinkMoreBeerMessage.message
            goingOutImage.image = drinkMoreBeerMessage.image
        }
    }
    
    func didExitCab(){
        if let exitCabMessage = DataLoader.sharedInstance.exitCabMessage {
            WifeAction.text = exitCabMessage.message
            goingOutImage.image = exitCabMessage.image
        }
    }
    
    func didCallCab(){
        if let callCabMessage = DataLoader.sharedInstance.callCabMessage {
            WifeAction.text = callCabMessage.message
            goingOutImage.image = callCabMessage.image
            
        }
    }
    
    func notifyObservers() {
        print(Notification.Name.self)
//        switch keyPath {
//        case .didArriveAtBar:
//            break
//        case .didDrinkMoreBeer:
//            break
//        case .didExitCab:
//            break
//        case .didCallCab:
//            break
//        }
//        if (keyPath == .didArriveAtBar) {
//            // TODO
//        } else if (keyPath == "didDrinkMoreBeer") {
//            // TODO
//        } else if (keyPath == "didExitCab") {
//            // TODO
//        } else if (keyPath == "didCallCab") {
//            // TODO
//        }
//        
    }
}

