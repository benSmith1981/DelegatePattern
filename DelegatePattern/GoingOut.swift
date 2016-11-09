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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "GoingOut", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func callWife(_ sender: AnyObject) {
        delegate?.didArriveAtBar()
    }

    @IBAction func callTaxi(_ sender: AnyObject) {
        delegate?.didArriveAtBar()
    }
    
    @IBAction func didDrinkMoreBeer(_ sender: AnyObject) {
        delegate?.didArriveAtBar()

    }
    
    @IBAction func exitTaxi(_ sender: AnyObject) {
        delegate?.didArriveAtBar()
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
