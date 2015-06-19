//
//  ERViewController.swift
//  StokePatrol
//
//  Created by Rachel Stevenson on 6/12/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ERViewController: XLFormViewController {
    
    private enum Tags : String {
        case WaveSize = "WAVE SIZE"
        case DateOfBirth = "DATEOFBIRTH"
        case ParentalEmail = "PARENTALEMAIL"
        case Email = "EMAIL"
        case Phone = "PHONE"
        case Password = "PASSWORD"
        case City = "CITY"
        case State = "STATE"
        case Bio = "BIO"
        case Position = "POSITION"
        case PrimaryTeam = "PRIMARYTEAM"
        case PrimaryTeamJerseyNumber = "JERSEYNUMBER"
        case SubTeamOne = "SUBTEAMONE"
        case SubTeamOneJerseyNumber = "SUBTEAMONEJERSEYNUMBER"
        case SubTeamTwo = "SUBTEAMTWO"
        case SubTeamTwoJerseyNumber = "SUBTEAMTWOJERSEYNUMBER"
        case School = "SCHOOL"
        case GPA = "GPA"
        case SATScore = "SATSCORE"
        case ACTScore = "ACTSCORE"
        case ConfirmButton = "CONFIRMBUTTON"
        case ShotCatch = "SHOTCATCH"
        case Username = "USERNAME"
    }
    
    var profileImage = UIImageView()
    
    let kPrimaryFontColor = UIColor.whiteColor()
    let kSecondaryFontColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1.0)
    let kStandardFont = UIFont(name: "HelveticaNeue-Thin", size: 17)!
    let kStandardBackgroundColor = UIColor(red:30/255, green: 32/255, blue: 35/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = kStandardBackgroundColor
        tableView.backgroundColor = kStandardBackgroundColor
        tableView.separatorInset.right = tableView.separatorInset.left
        
        let saveIcon = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveData")
        navigationItem.rightBarButtonItem = saveIcon
        saveIcon.tintColor = kPrimaryFontColor
        navigationItem.rightBarButtonItem?.tintColor = kPrimaryFontColor
        let backButton = UIBarButtonItem(title: "Hide", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Arial", size: 17)!], forState: UIControlState.Normal)
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIInterfaceOrientation.Portrait
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        initializeForm()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initializeForm()
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = kStandardBackgroundColor
        header.textLabel.textColor =  kSecondaryFontColor
        header.textLabel.font = kStandardFont
    }
    
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.frame = CGRectZero
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func toggleEditing(sender : UIBarButtonItem) {
        tableView.setEditing(!tableView.editing, animated: true)
        sender.title = tableView.editing ? "Editing" : "Not Editing"
    }
    
    func initializeForm() {
        
        var masterForm : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        masterForm = XLFormDescriptor(title: "Linda Mar") as XLFormDescriptor
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Edit Report") as! XLFormSectionDescriptor
        masterForm.addFormSection(section)
        
        //FULLNAME
        row = XLFormRowDescriptor(tag: Tags.WaveSize.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Wave size")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textLabel.textAlignment"] =  NSTextAlignment.Right.rawValue
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.placeholder"] = "Required..."
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "Shawn Wolf"
        
        section.addFormRow(row)
        
        
        /*        //button
        row = XLFormRowDescriptor(tag: Tags.ConfirmButton.rawValue, rowType: XLFormRowDescriptorTypeButton, title:"Confirm Now")
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
        row.action.formSelector = "buttonClick:"
        
        row.cellConfig["textLabel.color"] = UIColor.whiteColor()
        row.cellConfig["textLabel.font"] = UIFont(name: "Arial", size: 35)!
        section.addFormRow(row)
        */
        
        // DATEOFBIRTH
        row = XLFormRowDescriptor(tag: Tags.DateOfBirth.rawValue, rowType: XLFormRowDescriptorTypeDateInline, title:"Date Of Birth")
        var date = NSDate()
        row.value = date
        row.cellConfig["maximumDate"] = NSDate()
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["detailTextLabel.font"] = kStandardFont
        row.cellConfig["detailTextLabel.textColor"] = kPrimaryFontColor
        
        section.addFormRow(row)
        
        // EMAIL
        row = XLFormRowDescriptor(tag: Tags.ParentalEmail.rawValue, rowType: XLFormRowDescriptorTypeEmail, title: "Guardian Email")
        row.value = "user@email.com"
        row.addValidator(XLFormValidator.emailValidator())
        row.required = true
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        section.addFormRow(row)
        
        // PHONE
        row = XLFormRowDescriptor(tag: Tags.Phone.rawValue, rowType: XLFormRowDescriptorTypePhone, title: "Phone")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.value = "203-999-9999"
        
        row.required = true
        
        
        section.addFormRow(row)
        
        //CITY
        row = XLFormRowDescriptor(tag: Tags.City.rawValue, rowType: XLFormRowDescriptorTypeText, title: "City")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "Greenwich"
        section.addFormRow(row)
        
        
        // STATE
        
        row = XLFormRowDescriptor(tag :Tags.State.rawValue, rowType:XLFormRowDescriptorTypeSelectorActionSheet, title:"State")
        row.selectorOptions = ["CT", "NY", "MA", "NH", "NJ"]
        row.value = row.selectorOptions[0]
        row.cellConfigAtConfigure["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        
        row.cellConfig["detailTextLabel.font"] = kStandardFont
        row.cellConfig["detailTextLabel.textColor"] = kPrimaryFontColor
        section.addFormRow(row)
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Athletic Details") as! XLFormSectionDescriptor
        masterForm.addFormSection(section)
        
        row = XLFormRowDescriptor(tag :Tags.Position.rawValue, rowType:XLFormRowDescriptorTypeSelectorActionSheet, title:"Position")
        row.selectorOptions = ["Goalie", "Defensemen", "Right Wing", "Left Wing", "Center"]
        row.value = row.selectorOptions[1]
        row.cellConfigAtConfigure["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        
        row.cellConfig["detailTextLabel.font"] = kStandardFont
        row.cellConfig["detailTextLabel.textColor"] = kPrimaryFontColor
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.ShotCatch.rawValue, rowType: XLFormRowDescriptorTypeSelectorSegmentedControl, title: "Shot / Catch")
        row.selectorOptions = ["LEFT", "RIGHT"]
        row.value = row.selectorOptions[1]
        row.cellConfigAtConfigure["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        section.addFormRow(row)
        
        
        // TEAMS
        
        row = XLFormRowDescriptor(tag: Tags.PrimaryTeam.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Primary Team")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textLabel.textAlignment"] =  NSTextAlignment.Right.rawValue
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.placeholder"] = "Required..."
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "BC High (ECAC)"
        section.addFormRow(row)
        
        // Jersey Number
        row = XLFormRowDescriptor(tag: Tags.PrimaryTeamJerseyNumber.rawValue, rowType: XLFormRowDescriptorTypeNumber, title: "Primary Team Jersey Number")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "11"
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.SubTeamOne.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Secondary Team")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textLabel.textAlignment"] =  NSTextAlignment.Right.rawValue
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.placeholder"] = "Required..."
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "Choate"
        section.addFormRow(row)
        
        // Jersey Number
        row = XLFormRowDescriptor(tag: Tags.SubTeamOneJerseyNumber.rawValue, rowType: XLFormRowDescriptorTypeNumber, title: "Secondary Team Jersey Number")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "9"
        section.addFormRow(row)
        
        
        row = XLFormRowDescriptor(tag: Tags.SubTeamTwo.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Other Team")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textLabel.textAlignment"] =  NSTextAlignment.Right.rawValue
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.placeholder"] = "Required..."
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "Taft"
        section.addFormRow(row)
        
        // Jersey Number
        row = XLFormRowDescriptor(tag: Tags.SubTeamTwoJerseyNumber.rawValue, rowType: XLFormRowDescriptorTypeNumber, title: "Other Team Jersey Number")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "5"
        section.addFormRow(row)
        
        // SECTION - Academics
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Academics") as! XLFormSectionDescriptor
        masterForm.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: Tags.School.rawValue, rowType: XLFormRowDescriptorTypeText, title: "School")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "BC High"
        section.addFormRow(row)
        
        // GPA
        row = XLFormRowDescriptor(tag: Tags.GPA.rawValue, rowType: XLFormRowDescriptorTypeDecimal, title: "GPA")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "4.0"
        section.addFormRow(row)
        
        
        // SAT/ACT Score
        row = XLFormRowDescriptor(tag: Tags.SATScore.rawValue, rowType: XLFormRowDescriptorTypeNumber, title: "SAT Score")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "2400"
        section.addFormRow(row)
        
        // SAT/ACT Score
        row = XLFormRowDescriptor(tag: Tags.ACTScore.rawValue, rowType: XLFormRowDescriptorTypeNumber, title: "ACT Score")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "36"
        
        section.addFormRow(row)
        
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Application") as! XLFormSectionDescriptor
        masterForm.addFormSection(section)
        
        //FULLNAME
        row = XLFormRowDescriptor(tag: Tags.Username.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Username")
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textLabel.textAlignment"] =  NSTextAlignment.Right.rawValue
        
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.required = true
        row.value = "Username"
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.Email.rawValue, rowType: XLFormRowDescriptorTypeEmail, title: "Email")
        row.value = "user@email.com"
        row.addValidator(XLFormValidator.emailValidator())
        row.required = true
        
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.Password.rawValue, rowType: XLFormRowDescriptorTypePassword, title: "Password")
        row.cellConfig["backgroundColor"] = kStandardBackgroundColor
        row.cellConfig["textLabel.textColor"] = kPrimaryFontColor
        row.cellConfig["self.tintColor"] = kPrimaryFontColor
        row.cellConfig["textLabel.font"] = kStandardFont
        row.cellConfig["textField.textColor"] = kPrimaryFontColor
        row.cellConfig["textField.font"] = kStandardFont
        
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        row.value = "Password"
        
        section.addFormRow(row)
        form = masterForm
    }
    
    func goBack(){
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromBottom
        navigationController?.view.layer.addAnimation(transition, forKey: kCATransition)
        navigationController?.popViewControllerAnimated(false)
        
    }
    
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        //if self.form.formRowAtIndex(indexPath)?.tag == Tags.Teams.rawValue {
        //return 100
        //}
        //else {
        return super.tableView.rowHeight
        
        //}
    }
    
    
    //MARK: - Touch Button
    
    func buttonClick(sender: XLFormRowDescriptor) {
      if sender.tag == "CONFIRMBUTTON"{
        var alert = UIAlertController(title: "Confirm Slip Reservation", message: "By clicking Confirm, you agree to abide to all SlipShare Terms and Conditions.\n\nPlease review of Reservation Details carefully.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: { (action: UIAlertAction!) in
           }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(alert, animated: true, completion: nil)
    let searchProfile = UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("ERVC") as? UIViewController
    
    
    let transition = CATransition()
    transition.duration = 0.4
    transition.type = kCATransitionMoveIn
    transition.subtype = kCATransitionFromTop
    navigationController?.view.layer.addAnimation(transition, forKey: kCATransition)
    
    navigationController?.pushViewController(searchProfile!, animated: false)
    let detailImageVC = navigationController?.viewControllers.last as! ViewControllerc
    detailImageVC.number = "3"
    
    
    }
    self.deselectFormRow(sender)
    }

    //MARK: - Helperph
    
    func animateCell(cell: UITableViewCell) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values =  [0, 20, -20, 10, 0]
        animation.keyTimes = [0, (1 / 6.0), (3 / 6.0), (5 / 6.0), 1]
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.additive = true
        cell.layer.addAnimation(animation, forKey: "shake")
    }
    
    
    func saveData(){
        //Validate Form
        let array = formValidationErrors()
        for errorItem in array {
            let error = errorItem as! NSError
            let validationStatus : XLFormValidationStatus = error.userInfo![XLValidationStatusErrorKey] as! XLFormValidationStatus
            if validationStatus.rowDescriptor.tag == Tags.WaveSize.rawValue  {
                if let cell = tableView.cellForRowAtIndexPath(form.indexPathOfFormRow(validationStatus.rowDescriptor)) {
                    cell.backgroundColor = UIColor.whiteColor()
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        cell.backgroundColor = UIColor.whiteColor()
                    })
                }
            }
            else if validationStatus.rowDescriptor.tag == Tags.Email.rawValue || validationStatus.rowDescriptor.tag == Tags.Phone.rawValue{
                if let cell = tableView.cellForRowAtIndexPath(form.indexPathOfFormRow(validationStatus.rowDescriptor)) {
                    animateCell(cell)
                }
            }
        }
        
        
        //GetData
        
        var results = [String:String]()
        if let fullName = form.formRowWithTag(Tags.WaveSize.rawValue).value as? String {
            results[Tags.WaveSize.rawValue] = fullName
            println(results)
        }
        
        let x = form.formRowWithTag(Tags.DateOfBirth.rawValue).value as! NSDate
        
        
        var alert = UIAlertController(title: "Profile saved for \(form.formRowWithTag(Tags.WaveSize.rawValue).value)", message: "Please review of carefully.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        presentViewController(alert, animated: true, completion: nil)
        
    }
}

