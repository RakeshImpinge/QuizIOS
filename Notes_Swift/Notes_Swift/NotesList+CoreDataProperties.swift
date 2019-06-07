//
//  NotesList+CoreDataProperties.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//
//

import Foundation
import CoreData


extension NotesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesList> {
        return NSFetchRequest<NotesList>(entityName: "NotesList")
    }

    @NSManaged public var notes: String?

}
