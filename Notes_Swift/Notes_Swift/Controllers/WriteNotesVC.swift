//
//  WriteNotesVC.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//

import UIKit

class WriteNotesVC: UIViewController {
    
 
    @IBOutlet weak var txtVw: UITextView!
    
    
    // MARK:- <Life Cycle Methods>
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func acn_CancelBtn(_ sender: Any) {
        
         dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func saveBtn(_ sender: Any) {
        
        if txtVw.text != "" && txtVw.text != "Write your notes here" {

            FirebaseHelper.setNotesInFirebase(data:txtVw.text!) { (success, err) in
                if  success == true
                {
                    print("Data saved")
                }
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
        

        
        // NotesModel.shareInstance.setinfo(dict: notesList)
//         NotesList.saveDataToCoreData(obj: NotesModel.shareInstance)
        
        
        }
   
        
        
    }


//MARK:- <TextView Methods>

extension WriteNotesVC : UITextViewDelegate{

    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Write your notes here")
        {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
}
