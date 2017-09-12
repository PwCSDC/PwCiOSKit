//
//  Theme.swift
//  ExpertsLock
//
//  Created by ahu039 on 8/27/17.
//  Copyright © 2017 AH Studio. All rights reserved.
//

import UIKit

/**
 *  1. Try PwCThemeManager.applyTheme(theme: .white), if need to set theme color for the whole application, eg. including the color of leftBarItem, rightBarItem or button title color of UIActionSheet etc. BTW. we could define more colors in PwCTheme if needed
 *
 *  2. Try PwCThemeManager.currentTheme().setLightContent(), if need to set white color for navigation bar and status bar
 *
 */

let SelectedThemeKey = "SelectedThemeForUserDefault"

public enum PwCTheme: Int {
    case `default`, graphical ,white, dark
    
    public var mainColor: UIColor {
        switch self {
        case .default:
            return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        case .white:
            return UIColor.white
        case .dark:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
    
    public var barStyle: UIBarStyle {
        switch self {
        case .default, .graphical:
            return .default
        case .dark, .white:
            return .black
        }
    }

    //Set background color for navigation bar
    public func setNavigationBarBkgColor(color: UIColor) {
        UINavigationBar.appearance().barTintColor = color
    }
    
    //the text color in status bar will be white, also for the color of navigation bar title
    //if need to use different color for navigation bar title,call setNavigationBarTitleColor
    public func setLightContent()  {
        UINavigationBar.appearance().barStyle = .black
        
        //Set white color for leftBarItem, rightBarItem and backBarItem
        UINavigationBar.appearance().tintColor = UIColor.white

    }
    
    //Set color for navigation bar title
    public func setNavigationBarTitleColor(color: UIColor) {
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:color]
    }
    
    public func setNavigationBarBkgImg(imageName: String) {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: imageName), for: .default)
    }
    
    //Customize Navigation Bar back indicator
    //If needed, call this to customize mask image: UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMask")

    public func setNavigationItemBackImage(imageName: String) {
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: imageName)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: imageName)
    }
}



public struct PwCThemeManager {
    static public  func currentTheme() -> PwCTheme {
        if let storedTheme = UserDefaults.standard.value(forKey: SelectedThemeKey) {
            return PwCTheme(rawValue: storedTheme as! Int)!
        } else {
            return PwCTheme.default
        }
    }
    
    static public func applyTheme(theme: PwCTheme) {
        // 1
        UserDefaults.standard.set(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        // 2
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
    }
    
    
}
