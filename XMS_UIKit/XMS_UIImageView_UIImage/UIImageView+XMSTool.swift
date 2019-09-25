
//
//  UIImageView+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

extension UIImageView {
    
    /// 默认模式：contentMode = .scaleAspectFill
    public class func getImageV_XMS(frame:CGRect?) -> UIImageView {
        let imageV = UIImageView()
        imageV.backgroundColor = UIColor.clear
        if let frame = frame {
            imageV.frame = frame
        } else {
            imageV.frame = CGRect.zero
        }
        imageV.contentMode = .scaleAspectFill
        imageV.layer.masksToBounds = true
        return imageV
    }
}
