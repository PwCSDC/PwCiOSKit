//
//  DeviceExtension.swift
//  PwCiOSKit
//
//  Created by Sonic Lin on 9/18/17.
//  Copyright © 2017 PwC Inc. All rights reserved.
//

import Foundation

extension UIDevice{
    
    /// Differentiate iPhone X from other iPhone devices
    ///
    /// - Returns: <#return value description#>
    public func isiPhoneX() -> Bool{
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}
