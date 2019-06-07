//
//  NotesList+CoreDataClass.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(NotesList)
public class NotesList: NSManagedObject {
    
    
    
    
    
    class func deleteData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<NotesList>
        request = NotesList.fetchRequest()
        do {
            let results = try context.fetch(request)
            if(results.count>0){
                for object in results {
                    context.delete(object)
                }
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.saveContext()
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    class func getDataFromCoreData () -> NotesList
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<NotesList>
        request = NotesList.fetchRequest()
        do {
            let results = try context.fetch(request)
            return results.first!
        } catch let error {
           print(error.localizedDescription)
            return NotesList()
        }
    }
    
    
    
    
    class func saveDataToCoreData (obj:NotesModel)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var notesObj:NotesList?
        
        notesObj?.notes = notesObj?.notes
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveContext()
    
    
    
    }
}
