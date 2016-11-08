//
//  GoingOut.swift
//  DelegatePattern
//
//  Created by Ben Smith on 07/11/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import UIKit

class GoingOut: UIView {

    var delegate: CallWifeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func CallWife(sender: AnyObject) {
        delegate?.didArriveAtBar("arrived at bar")
    }

    @IBAction func callTaxi(sender: AnyObject) {
        delegate?.didArriveAtBar("Called Taxi")
    }
    
    @IBAction func exitTaxi(sender: AnyObject) {
        delegate?.didArriveAtBar("Exit Taxi")

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
