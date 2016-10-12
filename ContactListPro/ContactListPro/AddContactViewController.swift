//
//  AddContactViewController.swift
//  ContactListPro
//
//  Created by sylvain vincent on 29/09/2016.
//  Copyright © 2016 sylvain vincent. All rights reserved.
//

import UIKit
import CoreData

class AddContactViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addContact(_ sender: UIButton) {
        
        if(firstNameField.text == "" || phoneNumberField.text == ""){
                let alert = UIAlertController(title: "Informations", message: "Veillez remplir les champs obligatoires", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
           
        }else{
           self.addNewPerson()
        }
        
    }
    
    func addNewPerson(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let contact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into:context) as! Contact
        
        contact.firstName = (firstNameField.text!.capitalized as NSString?)
        contact.lastName = (lastNameField.text!.uppercased() as NSString?)
        contact.phoneNumber = phoneNumberField.text! as NSString?
        contact.email = emailField.text! as NSString?
        
        try? context.save()
        
        self.navigationController!.popViewController(animated: true)
        
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
