//
//  SK_Extensions.swift
//  DollyHouse-parent
//
//  Created by steve jobs on 26/05/16.
//  Copyright © 2016 samKolhe. All rights reserved.
//

import UIKit

let deviceWidth = UIScreen.main.bounds.size.width
private var kAssociationKeyNextField: UInt8 = 0


class SK_Extensions: NSObject {
    
}

//SET CUSTOM APP COLOR EASY ACCESS ANY WHERE AND SET IN STORYBORD
extension UIColor {
    
    @IBInspectable var AppColor: UIColor{
        return UIColor.red
    }
}

//UIAPPLICATION EXTENSION CLASS
//YOU CAN GET TOP VIEW CONTROLLER WHICH LIST OF ALL CONTROLLER
extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}


//UITEXTFIELD EXTENSION CLASS
extension UITextField {
    @IBInspectable var inset: CGFloat{
        get {
            
            return 0
        }
        set (size) {
            self.textRect(forBounds: bounds.insetBy(dx: inset, dy: inset))
        }
    }
    
    @IBInspectable var skTextSize: Bool {
        get {
            
            return false
        }
        set (size) {
            if(size)
            {
                self.font = self.font!.withSize((self.font?.pointSize)!+deviceWidth/200)
            }
        }
    }
    @IBInspectable var CommonTextColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.textColor = AppCommonColor
            }
        }
    }
    @IBInspectable var commonBackColor: Bool {
        get {
            
            return false
        }
        set (backColor) {
            if(backColor)
            {
                self.backgroundColor = AppCommonColor
            }
        }
    }
    
    var nextField: UITextField? {
        get {
            return objc_getAssociatedObject(self, &kAssociationKeyNextField) as? UITextField
        }
        set(newField) {
            objc_setAssociatedObject(self, &kAssociationKeyNextField, newField, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    @IBInspectable var isPhoneNumber: Bool {
        get {
            
            return false
        }
        set (isNo) {
            if(isNo)
            {
                self.keyboardType = UIKeyboardType.decimalPad
                let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
                doneToolbar.barStyle = UIBarStyle.default
                
                let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
                let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.dismissKeyBoard))
                doneToolbar.items = [flexSpace,done]
                doneToolbar.sizeToFit()
                
                self.inputAccessoryView = doneToolbar
            }
        }
    }
    
    func dismissKeyBoard()
    {
        self.resignFirstResponder()
    }
}

extension UILabel {
    
    @IBInspectable var skTextSize: Bool {
        get {
            
            return false
        }
        set (size) {
            if(size)
            {
                self.font = self.font!.withSize((self.font?.pointSize)!+deviceWidth/200)
            }
        }
    }
    @IBInspectable var CommonTextColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.textColor = AppCommonColor
            }
        }
    }
    @IBInspectable var commonBackColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.backgroundColor = AppCommonColor
            }
        }
    }
}

extension UITextView {
    @IBInspectable var skTextSize: Bool {
        get {
            
            return false
        }
        set (size) {
            if(size)
            {
                self.font = self.font!.withSize((self.font?.pointSize)!+deviceWidth/200)
            }
        }
    }
    @IBInspectable var CommonTextColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.textColor = AppCommonColor
            }
        }
    }
    @IBInspectable var commonBackColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.backgroundColor = AppCommonColor
            }
        }
    }
}

extension UIButton {
    @IBInspectable var skTextSize: Bool {
        get {
            
            return false
        }
        set (size) {
            if(size)
            {
                self.titleLabel!.font = self.titleLabel!.font.withSize((self.titleLabel!.font.pointSize)+deviceWidth/200)
            }
        }
    }
    @IBInspectable var CommonTextColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.titleLabel?.textColor = AppCommonColor
            }
        }
    }
    @IBInspectable var commonBackColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.backgroundColor = AppCommonColor
            }
        }
    }
}

extension UIView {
    @IBInspectable var setBorder: Bool {
        get {
            
            return false
        }
        set (flag) {
            self.layer.borderColor = UIColor.white.cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 2
            
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 0.2
        }
        
    }
    
    @IBInspectable var CommonBackgroundColor: Bool {
        get {
            
            return false
        }
        set (color) {
            if(color)
            {
                self.backgroundColor = AppCommonColor
            }
        }
    }
    
}

extension UIImage {
    
    //ROTATE IMAGE AS SET DEGREE
    public func imageRotatedByDegrees(_ degrees: CGFloat, flip: Bool) -> UIImage {
        let radiansToDegrees: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / CGFloat(M_PI))
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap?.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        bitmap?.rotate(by: degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        bitmap?.scaleBy(x: yFlip, y: -1.0)
        bitmap?.draw(cgImage!, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}

extension CALayer {
    
    //SET BORDER LINE OF OBJECT LAYER
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        print(edge)
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}


