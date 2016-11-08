//
//  GoingOut.swift
//  DelegatePattern
//
//  Created by Ben Smith on 07/11/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import UIKit

@IBDesignable class GoingOut: UIView {

    var delegate: CallWifeDelegate?
    var view: UIView!

    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "GoingOut", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
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
