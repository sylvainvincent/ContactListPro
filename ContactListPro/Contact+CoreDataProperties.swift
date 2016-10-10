//
//  Contact+CoreDataProperties.swift
//  ContactListPro
//
//  Created by sylvain vincent on 29/09/2016.
//  Copyright © 2016 sylvain vincent. All rights reserved.
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact");
    }

    @NSManaged public var firstName: NSObject?
    @NSManaged public var lastName: NSObject?
    @NSManaged public var phoneNumber: NSObject?

}
