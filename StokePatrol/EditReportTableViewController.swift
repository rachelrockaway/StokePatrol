//
//  EditReportTableViewController.swift
//  StokePatrol
//
//  Created by Rachel Stevenson on 6/10/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//


import UIKit

class EditReportTableViewController: UITableViewController, UITextViewDelegate {
    
    
    //Data Variables
    
    //Outlets
    
    @IBOutlet weak var editBreakLabel: UILabel!
    
    @IBOutlet weak var reportTextView: UITextView!
    
    @IBOutlet weak var charRemainingLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    reportTextView.layer.cornerRadius = 5
    reportTextView.delegate = self
    
    reportTextView.becomeFirstResponder()
    
    }
    
    //Actions

    @IBAction func sendReport(sender: AnyObject) {
        
        var report = PFObject(className: "Reports")
        report["content"] = reportTextView.text
        report["reporter"] = PFUser.currentUser()
        
        report.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                //The object has been saved
            } else {
                // There was a problem
            }
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range:NSRange, replacementText text: String) -> Bool {
        
        var newLength = (textView.text as NSString).length + (text as NSString).length - range.length
        var remainingChar = 140 - newLength
        
        charRemainingLabel.text = "\(remainingChar)"
        
        return (newLength >= 140) ? false : true
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
