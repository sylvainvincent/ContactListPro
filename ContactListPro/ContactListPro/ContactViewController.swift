//
//  ContactViewController.swift
//  ContactListPro
//
//  Created by sylvain vincent on 29/09/2016.
//  Copyright © 2016 sylvain vincent. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var firstName:String?
    var lastName:String?
    var phoneNumber:String?
    var email:String?
    var contact:Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if contact != nil{
            firstNameLabel.text = contact?.firstName as! String?
            lastNameLabel.text = contact.lastName as! String?
            phoneNumberLabel.text = contact.phoneNumber as! String?
            emailLabel.text = contact.email as! String?
        }else{
            print("contact nul")
        }
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
