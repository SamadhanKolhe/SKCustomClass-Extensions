//
//  SKErrorAlert.swift
//  SK_CustomClass+Extensions
//
//  Created by steve jobs on 11/01/17.
//  Copyright © 2017 samKolhe. All rights reserved.
//

import UIKit

public class SKErrorAlert: NSObject {

    //GET APPLICATION NAME FOR DEFAULT SET ALERT TITLE
    let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    
    //SHOW ALERT WHEN SERVER NOT RESPONDING WITH ANY DATA OR DEVICE NETWORK ISSUES
    func ErrorAlert(_ controller:UIViewController)
    {
        let alert=UIAlertController(title: appName, message: "The server not responding, Please try again later.", preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil));
        controller.present(alert, animated: true, completion: nil);
        
    }
    
    //SHOW ALERT WHEN DEVICE IS NOT CONNECTED WITH NETWORK
    func NetworkAlert(_ controller:UIViewController)
    {
        let alert=UIAlertController(title: appName, message: "Please connect your device with mobile data or wifi!", preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil));
        controller.present(alert, animated: true, completion: nil);
        
    }
    
    //SHOW ALERT WHEN USER DID SET ANY VALIDATION WITH CUSTOM MASSAGE
    func ValidationAlert(_ message:String, controller:UIViewController)
    {
        let alert=UIAlertController(title: appName, message: message, preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil));
        controller.present(alert, animated: true, completion: nil);
        
    }
    
    
}
