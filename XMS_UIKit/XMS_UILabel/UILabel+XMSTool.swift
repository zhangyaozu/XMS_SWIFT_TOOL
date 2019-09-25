//
//  UILabel+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

extension UILabel {
    /**
     封装的UILabel 初始化
     
     - parameter frame:      大小位置
     - parameter textString: 文字
     - parameter font:       字体
     - parameter textColor:  字体颜色
     
     - returns: UILabel
     */
    public class func getLabel_XMS(frame:CGRect? = nil, textString:String? = nil, font:UIFont, textColor:UIColor? = nil) -> UILabel {
        let aLabel = UILabel()
        aLabel.backgroundColor = UIColor.clear
        aLabel.text = textString
        aLabel.font = font
        aLabel.textColor = textColor
        if let frame = frame {
            aLabel.frame = frame
        }
        return aLabel
    }
}
