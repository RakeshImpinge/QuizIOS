//
//  AddNotesVC.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//

import UIKit
import Firebase



class AddNotesVC: UIViewController {

    
    @IBOutlet weak var tblVw_showNotes: UITableView!
    
    var refreshControl = UIRefreshControl()

    
  
    var notesArr = NSMutableArray()
    
    
    //MARK:- <Life Cycle Methods>
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let notesRef =  Database.database().reference(withPath: "notes")
        notesRef.keepSynced(true)
        
        
        Common_Methods.showIndicator(view: self.view)
     
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tblVw_showNotes.addSubview(refreshControl)
     
    }
    
     // Code to refresh table view
    @objc func refresh(sender:AnyObject) {
       
        let notesRef =  Database.database().reference(withPath: "notes")
        notesRef.keepSynced(true)
        
        
        notesArr = NSMutableArray()
        FirebaseHelper.ref.child("notes").observe(.childAdded) { (snapshot) in
            
            print(snapshot)
            let value = snapshot.value as? String
            let id  = snapshot.key
            
            let dict = ["key":id,"value":value]
            
            if self.notesArr.count > 0 {
                
            }
            else{
                
            }
            
            
            self.notesArr.add(dict)
            
            
            DispatchQueue.main.async{
                self.tblVw_showNotes.reloadData()
            }
        }
        
        
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
         FirebaseHelper.ref.removeAllObservers()
       super.viewDidAppear(animated)
        
       
        notesArr = NSMutableArray()
        FirebaseHelper.ref.child("notes").observe(.childAdded) { (snapshot) in
        
            print(snapshot)
            let value = snapshot.value as? String
            let id  = snapshot.key
           
            let dict = ["key":id,"value":value]

        
        
            
            self.notesArr.add(dict)
            
            
            DispatchQueue.main.async{
            self.tblVw_showNotes.reloadData()
            }
        }
        
         Common_Methods.hideIndicator(view: self.view)
        
    }
    

}

//MARK:- <TableView Methods>
extension AddNotesVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = (notesArr[indexPath.row] as! NSDictionary).value(forKey: "value") as? String
        
        return cell
    }
    
   

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewItem", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
       
            let idString = (notesArr[indexPath.row] as! NSDictionary).value(forKey: "key") as! String
            let childUpdates = [idString: nil] as [String : Any?]
            FirebaseHelper.ref.child("notes").updateChildValues(childUpdates) { (err, ref) in
                if err == nil
                {
                    print("Data updated")
                }
            }
            

            notesArr.removeObject(at: indexPath.row)

             self.tblVw_showNotes.reloadData()
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewItem" {
            if let destination = segue.destination as? ViewNotesVC {
                let selectedItem = tblVw_showNotes.indexPathForSelectedRow!.row
                let arrayIndex = selectedItem
                destination.selectedItem = notesArr[selectedItem] as! NSDictionary
                //destination.arrayIndex = arrayIndex
            }
        }
    }
    
    @IBAction func unwindToAddNotes(segue: UIStoryboardSegue){
    }
}
