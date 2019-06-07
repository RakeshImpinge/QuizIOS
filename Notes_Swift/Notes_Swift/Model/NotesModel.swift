//
//  NotesModel.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//

import UIKit

class NotesModel {
    
     static let shareInstance = NotesModel()
    
    
    var notesList = [String]()
    
    
    func setinfo(dict: [String])
    {
        print(dict)
        
        if dict.count > 0{
      self.notesList = dict
        }

    }
    
    
    
    
}
