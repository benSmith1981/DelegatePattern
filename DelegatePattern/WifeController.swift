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
        loadMessages()
        goingOutView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        //goingOutView.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func didArriveAtBar(){
        WifeAction.text = arriveAtBarMessage.message
        goingOutImage.image = arriveAtBarMessage.image
    }
    
    func didDrinkMoreBeer(){
        WifeAction.text = drinkMoreBeerMessage.message
        goingOutImage.image = drinkMoreBeerMessage.image

    }
    
    func didExitCab(){
        WifeAction.text = exitCabMessage.message
        goingOutImage.image = exitCabMessage.image
    }
    
    func didCallCab(){
        WifeAction.text = callCabMessage.message
        goingOutImage.image = callCabMessage.image
    }
    
    
    func loadMessages() {
        arriveAtBarMessage = Messages.init(message: "I am cooking dinner come home soon", image: #imageLiteral(resourceName: "dinner"))
        drinkMoreBeerMessage = Messages.init(message: "Stop drinking!", image: #imageLiteral(resourceName: "beer"))
        exitCabMessage = Messages.init(message: "Dinner is cold", image: #imageLiteral(resourceName: "exitCab"))
        callCabMessage = Messages.init(message: "Hurry dinner is ready", image: #imageLiteral(resourceName: "callCab"))

    }
}

