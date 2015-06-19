//
//  ViewControllerc.swift
//  StokePatrol
//
//  Created by Rachel Stevenson on 6/12/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ViewControllerc: UIViewController {

    
    
    var number = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("Success" + number)
        
        var alert = UIAlertController(title: "Confirm Slip Reseration", message: "By clicking Confirm, you agree to abide to all SlipShare Terms and Conditions.\n\nPlease review of Reservation Details carefully.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        presentViewController(alert, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
