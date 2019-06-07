//
//  ViewNotesVC.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//

import UIKit

class ViewNotesVC: UIViewController {

    @IBOutlet weak var txtVw_View: UITextView!
    
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    var selectedItem = NSDictionary()
    var arrayIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtVw_View.text = selectedItem .value(forKey: "value") as? String
    }
    

    @IBAction func acn_CancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func acn_EditBtn(_ sender: UIBarButtonItem) {
        if btnEdit.title == "Edit"
        {
           
            btnEdit.title = "Save"
            txtVw_View.isEditable = true
            txtVw_View.becomeFirstResponder()
        }
        else
        {
           
            btnEdit.title = "Edit"
            txtVw_View.isEditable = false
            txtVw_View.resignFirstResponder()
            
            if txtVw_View.text == ""
            {
//                Do nothing
            }
            else
            {

                self.editText(id:selectedItem .value(forKey: "key") as! String, editedText: txtVw_View.text)
            }
            dismiss(animated: true, completion: nil)
        }
    }
    
    func editText(id:String,editedText:String)
    {
        let childUpdates = [id: editedText]
        
        FirebaseHelper.ref.child("notes").updateChildValues(childUpdates) { (err, ref) in
            
            if err == nil
            {
                print("Data updated")
            }
       }
    }
    
}
