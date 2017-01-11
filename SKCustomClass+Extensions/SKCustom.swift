//
//  SKCustom.swift
//  SK_CustomClass+Extensions
//
//  Created by steve jobs on 11/01/17.
//  Copyright © 2017 samKolhe. All rights reserved.
//

import UIKit

let APP_NAME         = Bundle.main.infoDictionary!["CFBundleName"] as! String
let SCREEN_HEIGHT    = UIScreen.main.bounds.size.height
let SCREEN_WIDTH     = UIScreen.main.bounds.size.width
var DEFAULTS         = UserDefaults.standard

class SKCustom: NSObject {
    
//YOU CAN ADD TEXT ON OVER IMAGE IN IMAGEVIEW WITH CUSTOM TEXT SIZE
    func addTextOnImageView(_ imageView:UIImageView,text:String,fontSize:CGFloat) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageView.bounds.size.width, height: imageView.bounds.size.height), false, 0)
        
        let maxTextRect = CGRect(x: 0, y: 0, width: imageView.bounds.size.width, height: imageView.bounds.size.height);
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attrs = [NSFontAttributeName: UIFont(name: "Noteworthy-Light", size: fontSize)!,NSParagraphStyleAttributeName: paragraphStyle,NSForegroundColorAttributeName:UIColor.lightGray]
        
        let string:NSMutableString = NSMutableString(string: text)
        let actualRect =  string.boundingRect(with: maxTextRect.size, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        
        let drawRect = CGRect(x: maxTextRect.minX + ((maxTextRect.width - actualRect.width) * 0.5)
            , y: maxTextRect.minY + ((maxTextRect.height - actualRect.height) * 0.5)
            , width: actualRect.width
            , height: actualRect.height)
        string.draw(with: drawRect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 7
        return img!
        
    }
    
    //CHANGE IMAGEVIEW IMAGE TINT COLOR WITH YOUR CUSTOM COLOR
    func setTintImageWithColor(_ tintImage:UIImageView, image:UIImage, color:UIColor)
    {
        tintImage.image = image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tintImage.tintColor = color
    }
    
    //CHANGE BUTTON IMAGE TINT COLOR WITH YOUR CUSTOM COLOR
    func setTintButtonImage(_ tintImage:UIButton, image:UIImage, color:UIColor)
    {
        tintImage.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: UIControlState())
        tintImage.tintColor = color
    }
    
    //CHANGE TEXT FONT SIZE AS PER DEPEND ON LABLE HEIGHT
    func UpdateLabelTextSize(_ label:UILabel) {
        if (label.text!.isEmpty || label.bounds.size.equalTo(CGSize.zero)) {
            return;
        }
        
        let textViewSize = label.bounds.size;
        let fixedWidth = textViewSize.width-20;
        let expectSize = label.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)));
        
        var expectFont = label.font;
        if (expectSize.height > textViewSize.height) {
            while (label.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT))).height > textViewSize.height) {
                expectFont = label.font!.withSize(label.font!.pointSize - 1)
                label.font = expectFont
            }
        }
        else {
            while (label.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT))).height < textViewSize.height) {
                expectFont = label.font;
                label.font = label.font!.withSize(label.font!.pointSize + 1)
            }
            label.font = expectFont;
        }
    }

    
    
    //SET IMAGEVIEW BORDER
    func setImageBorder(_ sView:UIImageView)
    {
        sView.layer.borderColor = UIColor.gray.cgColor
        sView.layer.borderWidth = 1
        sView.layer.masksToBounds = true
        sView.layer.cornerRadius = sView.frame.size.width/2
    }
    
    //SET BUTTON BORDER
    func setButtonBorder(_ sView:UIButton)
    {
        sView.layer.borderColor = UIColor.gray.cgColor
        sView.layer.borderWidth = 1
        sView.layer.masksToBounds = true
        sView.layer.cornerRadius = sView.frame.size.width/2
    }
    
    //SET TABLE VIEW BORDER WITH SHODOW
    func setTableViewBorder(_ sView:UITableView)
    {
        sView.layer.borderColor = UIColor.white.cgColor
        sView.layer.borderWidth = 1
        sView.layer.cornerRadius = 5
        
        sView.layer.shadowColor = UIColor.black.cgColor
        sView.layer.shadowOffset = CGSize.zero
        sView.layer.shadowOpacity = 0.5
        sView.layer.shadowRadius = 2
    }
    
    //SET UIVIEW BORDER WITH SHODOW
    func setViewBorder(_ sView:UIView)
    {
        sView.layer.borderColor = UIColor.white.cgColor
        sView.layer.borderWidth = 1
        sView.layer.cornerRadius = 5
        
        sView.layer.shadowColor = UIColor.black.cgColor
        sView.layer.shadowOffset = CGSize.zero
        sView.layer.shadowOpacity = 0.5
        sView.layer.shadowRadius = 2
    }
    
    //SET TEXTFILED NEXT RESPONDER FLOW AS PER DEPEND INDEX OF TEXTFILED
    func ToNext(_ textFields:[UITextField])
    {
        for index in 0...textFields.count-1
        {
            let firstTextField = textFields[index]
            firstTextField.returnKeyType = UIReturnKeyType.next
            var secondTextFiled = UITextField()
            if(index == textFields.count-1)
            {
                secondTextFiled = textFields[index]
                secondTextFiled.returnKeyType = UIReturnKeyType.default
            }else
            {
                secondTextFiled = textFields[index+1]
            }
            firstTextField.nextField = secondTextFiled
        }
    }
    
}
