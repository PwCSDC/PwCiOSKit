//
//  PwCUtilities.swift
//  PwCMobileKit
//
//  Created by ahu039 on 7/20/17.
//  Copyright © 2017 PwC Inc. All rights reserved.
//

import UIKit

public class PwCUtilities: NSObject {
    
    /*
     * Get value from NSUserDefault
     */
    public class func userDefaultValue(forKey key: String) -> AnyObject? {
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    
    
    /*
     * Set and sync value into NSUserDefault
     */
    public class func setUserDefault(_ object: Any, forKey key: String) {
        UserDefaults.standard.set(object, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /*
     * Remove key/value from UserDefault, and synchronize
     */
    public class func removeUserDefault(forKey key: String) {
        let value = self.userDefaultValue(forKey: key) as? String
        if value != nil {
            UserDefaults.standard.removeObject(forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    /*
     * Allow alphabet, numeric characters, '-', '_' and '.'
     */
    public class func removeSpecialCharInURL(_ inputString: String) -> String {
        let strWithoutSpace = inputString.replacingOccurrences(of: " ", with:"-")
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789-_.".characters)
        let replacedString = String(strWithoutSpace.characters.filter {okayChars.contains($0) })
        return replacedString
    }
    
    /**
     * Load UIViewController from Main Storyboard with name:Main.storyboard
     */
    public class func loadViewControllerFromMainStoryboard (_ nibName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: nibName)
        return viewController
    }
    
    /**
     * Return true if is landscape, otherwise false
     */
    public class func isLandscape() -> Bool {
        if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
            return true
        }
        return false
    }
    
    /**
     * Return true if is a valid email address, othereise false
     */
    public class func isValidEmail(_ emailString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailString)
    }
    
    /**
     * Return true if is integer value eg. 10
     */
    public class func isInteger(_ textString: String) -> Bool {
        let intRegEx = "^[0-9]*$"
        let intTest = NSPredicate(format:"SELF MATCHES %@", intRegEx)
        return intTest.evaluate(with: textString)
    }
    
    /**
     * Return true if match eg. 91.12
     */
    public class func isDigital(_ textString: String) -> Bool {
        let intRegEx = "^[0-9]+(.[0-9]{1,2})?$"
        let intTest = NSPredicate(format:"SELF MATCHES %@", intRegEx)
        return intTest.evaluate(with: textString)
    }
    
    /**
     * Should match format ***-***-****
     */
    public class func isValidUSPhone(_ phoneString: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: phoneString)
    }
    
    /**
     * Started with 'http' or 'https' and check standard url format
     */
    public class func isValidHttpURL(_ candidate : String) -> Bool {
        let urlRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        return urlTest.evaluate(with: candidate)
    }
    
    /**
     * Get App Version # from info.plist
     */
    public class func appVersion() -> String {
        let  infoDictionary = Bundle.main.infoDictionary
        let majorVersion : AnyObject? = infoDictionary! ["CFBundleShortVersionString"] as AnyObject?
        return majorVersion as! String
    }
    
    /**
     * Parsing base64 String into Image, possibly return nil if the input parameter is not base64 String of a valid image
     * - parameter strEncodeData: base64 String
     * - returns: The image parsed by base64 string, or nil if not valid base64 string passed over
     */
    public class func base64StringToImage(_ strEncodeData: String) -> UIImage? {
        let baseData = Data(base64Encoded: strEncodeData, options: .ignoreUnknownCharacters)
        let image = UIImage(data: baseData!)
        return image
    }
    
    /**
     *  Document to base 64 string
     */
    public class func documentToBase64String(DocumentPath documentPath: String) -> String? {
        let documentData = try? Data(contentsOf: URL(fileURLWithPath: documentPath))
        if documentData != nil {
            let documentBase = documentData!.base64EncodedString(options: .lineLength64Characters)
            return documentBase
        }
        return nil
    }
    
}
