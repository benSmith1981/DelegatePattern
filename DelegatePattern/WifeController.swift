//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Ben Smith on 07/11/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import UIKit

protocol CallWifeDelegate: class {
    func didArriveAtBar(message: String)
    func didUpdateAlcoholLevel(message: String)
    func didDrinkBeerNumber(message: String)
    func didCallCab(message: String)

}

class WifeController: UIViewController, CallWifeDelegate {

    @IBOutlet weak var WifeAction: UITextField!
    @IBOutlet weak var goingOutView: GoingOut!
    override func viewDidLoad() {
        super.viewDidLoad()
        goingOutView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        //goingOutView.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func didArriveAtBar(message: String){
        WifeAction.text = message
    }
    
    func didUpdateAlcoholLevel(message: String){
        WifeAction.text = message

    }
    
    func didDrinkBeerNumber(message: String){
        WifeAction.text = message

    }
    
    func didCallCab(message: String){
        WifeAction.text = message

    }
}

