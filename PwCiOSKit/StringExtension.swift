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
    
    /**
     Convert float string to formated string with permillage
     
     @param precision: keep digital
     
     @return  precision is equal to 3, 100000.3456 -> 100,00.35
     */
    public func separateFloatStringWith(precision: Int ) -> String{
        let formatter = NumberFormatter()
        let value = (self as NSString).doubleValue
        var format = NSMutableString(string: "###,##0")
        if(precision == 0)
        {
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: value))!
            
        }
        else
        {
            format = NSMutableString(string: "###,##0.")
            for _ in 1...(precision - 1)
            {
                format.appendFormat("0")
            }
            formatter.positiveFormat = format as String
            return formatter.string(from: NSNumber(value: value))!
        }
    }
    /**
     Calculate the height for special Font
     
     @param width: width for UILabel/UItextfield/UITextview, etc.
     
     @param font: special UIFont
     
     @return  height
     */
    public func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> Float {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return Float(boundingBox.height)
    }
    /**
     Calculate the width for special Font
     
     @param height: height for UILabel/UItextfield/UITextview, etc.
     
     @param font: special UIFont
     
     @return  width
     */
   public func widthWithConstraintedHeight(height: CGFloat, font: UIFont) -> Float {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return Float(boundingBox.width)
    }

}

