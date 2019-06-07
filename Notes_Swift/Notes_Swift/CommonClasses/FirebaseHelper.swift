//
//  FirebaseHelper.swift
//  Notes_Swift
//
//  Created by admin on 29/01/19.
//  Copyright © 2019 Nisha. All rights reserved.
//

import UIKit
import Firebase





class FirebaseHelper {
    
    // reference
    static var ref = DatabaseReference()
    
 //Configure the database
    class func configure () {
        
        setupRef()
    }
    
    // MARK:- <Database methods>
    class func setupRef(){
        Database.database().isPersistenceEnabled = true
        
        ref = Database.database().reference()
       
    }
    
   
    // MARK:- <For Saving DataIn Firebase>
    class func setNotesInFirebase(data:String, result: @escaping (_ success:Bool,_ error:Error?) -> Void){
        
        self.ref.child("notes").childByAutoId().setValue(data) { (err, ref) in
            if let error = err
            {
                result(false,error)
            }
            else
            {
                print("Data saved successfully!")
                result(true,nil)
            }
        }
    }
    
    
    
        
}


