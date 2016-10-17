//
//  ContactViewController.swift
//  ContactListPro
//
//  Created by sylvain vincent on 29/09/2016.
//  Copyright © 2016 sylvain vincent. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, MFMessageComposeViewControllerDelegate, UITabBarDelegate {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    var contact:Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if contact != nil{
            firstNameLabel.text = contact.firstName as! String?
            lastNameLabel.text = contact.lastName as! String?
            phoneNumberButton.setTitle(contact.phoneNumber as! String?, for: UIControlState.normal)
            emailLabel.text = contact.email as! String?
        }else{
            print("contact nul")
        }
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionPhone(_ sender: UIButton) {
        print("test 1")
        if let phoneNumb = phoneNumberButton.titleLabel?.text {
            /*print("test : \(phoneNumb)")
            let url = URL(string : "tel://\(phoneNumb)")!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            }*/
            print("test 2")
            if (MFMessageComposeViewController.canSendText()) {
                print("hello")
                let message = MFMessageComposeViewController()
                message.messageComposeDelegate = self
                message.body = "Message Body"
                message.recipients = [phoneNumb]
                self.present(message, animated: true, completion: nil)
            }
            else{
                let errorAlert = UIAlertController(title: "Envoie impossible", message: "Cette appareil ne peut pas envoyer de messages", preferredStyle: UIAlertControllerStyle.alert)
                errorAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(errorAlert, animated: true, completion: nil)
            }
            
        }

    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func share(_ sender: AnyObject) {
        
        let test = ["\(contact.firstName!) : \(contact.phoneNumber)"]
        
        let activityViewController = UIActivityViewController(activityItems: test, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch (result.rawValue) {
        case MessageComposeResult.cancelled.rawValue:
            print("Message was cancelled \n")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.failed.rawValue:
            print("Message failed \n")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.sent.rawValue:
            print("Message was sent \n")
            self.dismiss(animated: true, completion: nil)
        default:
            print("Autre erreur \n")
            break;
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           self.navigationController?.isNavigationBarHidden = false
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
          print("0")
        let title = item.title!
        
        switch title {
        case "Appeller":
            print("1")
        case "Envoyer Sms":
            print("2")
        case "Modifier":
            print("3")
        default:
            print("4")
        }

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
