//
//  SKNetworkReachability.swift
//  SK_CustomClass+Extensions
//
//  Created by steve jobs on 11/01/17.
//  Copyright © 2017 samKolhe. All rights reserved.
//

import UIKit
import SystemConfiguration

class SKNetworkReachability: NSObject {

    //CHECK USER DEVICE IS CONNECT WITH MOBILE DATA OR WIFI
    func isConnected(_ showAlert: Bool, controller: UIViewController) -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            
            //IF YOU WANT MESSAGE WHEN IF DEVICE NOT CONNECT WITH NETWORK
            if(showAlert)
            {
                SKErrorAlert().NetworkAlert(controller)
            }
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
        
    }
}
