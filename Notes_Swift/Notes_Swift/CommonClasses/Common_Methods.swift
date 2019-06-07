 //
//  Common_Methods.swift
//  Notes_Swift
//
//  Created by Nisha on 6/6/19.
//  Copyright © 2019 Nisha. All rights reserved.
//

 

import UIKit
import Foundation
import NVActivityIndicatorView

 
class Common_Methods: NSObject
{
    
    class func showIndicator(view:UIView)
    {
        let nv = NVActivityIndicatorView(frame: CGRect(x:view.frame.size.width/2-25,y:view.frame.size.height/2-25,width:50,height:50), type: .ballSpinFadeLoader, color: UIColor.black, padding: nil)
        
        nv.tag = 6575
        view.addSubview(nv)
        nv.startAnimating()
    }
    
    class func hideIndicator(view:UIView)
    {
        for case let v as NVActivityIndicatorView in view.subviews
        {
            v.stopAnimating()
            if v.tag == 6575
            {
                v.removeFromSuperview()
            }
        }
        
    }
  
    
}

