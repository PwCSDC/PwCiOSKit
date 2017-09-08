//
//  StringExtension.swift
//  REX
//
//  Created by Aaron Hu on 8/24/15.
//  Copyright (c) 2015 PwC Inc. All rights reserved.
//

import Foundation

extension String {
    
    public var length: Int {
        return self.characters.count
    }
    
    public var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    public var isDigital: Bool{
        let digitalRx = "^[0-9]*$"
        let digitalTest = NSPredicate(format:"SELF MATCHES %@", digitalRx)
        return digitalTest.evaluate(with: self)
    }
    
    public var isAlphabet: Bool {
        let alphabetRex = "^[a-zA-Z]+$"
        let alphabetTest = NSPredicate(format:"SELF MATCHES %@", alphabetRex)
        return alphabetTest.evaluate(with: self)
    }
    
    public var floatValue: Float? {
        return Float(self)
    }
    
    public var localizedString: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    

    public func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
	
	public func removeAllSpaces() -> String {
		return self.replacingOccurrences(of: " ", with: "")
	}
    
    public func removeSpaceAndLine() -> String {
        //Remove both whitespace and line character in front and rear
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func stringByAppendingPathComponent(_ path: String) -> String {
        
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
    
}

