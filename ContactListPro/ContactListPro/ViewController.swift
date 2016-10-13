//
//  ViewController.swift
//  ContactListPro
//
//  Created by sylvain vincent on 29/09/2016.
//  Copyright © 2016 sylvain vincent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var contactTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var contactList = [Contact]()
    var test:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contact"
        contactTableView.dataSource = self
        contactTableView.delegate = self
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       // let request = NSFetchRequest(entityName: "Contact")
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do{
            let contacts = try self.context.execute(request) as! NSAsynchronousFetchResult<Contact>
            
            contactList = contacts.finalResult!
            
            /*if(contactList != nil){
                for c in contactList!{
                    print("\(c.firstName!) \(c.lastName!)")
                }
            }*/
        } catch{
            print("Erreur")
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            contactList = try context.fetch(Contact.fetchRequest())
        }catch{
            print("erreur")
        }
        
        contactTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.contactTableView.dequeueReusableCell(withIdentifier: "Cell") as! ContactCustomCell
        
        var name = "\(contactList[indexPath.row].firstName!)"
        name += " \(contactList[indexPath.row].lastName!)"
        
        cell.nameLabel?.text = name
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactView = self.storyboard?.instantiateViewController(withIdentifier: "A") as! ContactViewController
        contact = (self.contactList?[indexPath.row])
        // contactView.firstNameLabel!.text = (self.contactList?[indexPath.row].firstName) as?String
        self.navigationController?.pushViewController(contactView, animated: true)
    }*/
    
    /*func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let contactView = self.storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        contact = (self.contactList?[indexPath.row])
        print("TEST")
        print("Contact \(contact)")
        print("Prénom : \(contact.firstName)")
       // contactView.lastNameLabel.text = (self.contactList?[indexPath.row].lastName) as? String
       // contactView.phoneNumberLabel.text = (self.contactList?[indexPath.row].phoneNumber) as? String
        self.navigationController?.pushViewController(contactView, animated: true)

    }
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            context.delete((self.contactList[indexPath.row]))
            
            do{
                try context.save()
                contactList = try context.fetch(Contact.fetchRequest())
            }
            catch{
                print("erreur")
            }
            
            contactTableView.reloadData()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var indexPath = self.contactTableView.indexPathForSelectedRow!
        var contact = contactList[indexPath.row]
   
        if let contactView = segue.destination as? ContactViewController{
            contactView.contact = contact
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*@IBAction func addContact(){
        print("test")
        let addContactVC = AddContactViewController()
        self.navigationController?.pushViewController(addContactVC, animated: true)
    }*/
    
}

