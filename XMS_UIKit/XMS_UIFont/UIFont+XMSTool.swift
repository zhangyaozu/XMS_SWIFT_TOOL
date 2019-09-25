//
//  UIFont+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

/// 统一获取字体的方法
public func FONT_PingFang_XMS(fontSize: CGFloat) -> UIFont {
    var font = UIFont.init(name: "PingFangSC-Regular", size: fontSize)
    if !kIs_iOS9_XMS {
        font = UIFont.init(name: "Helvetica", size: fontSize)
    }
    return font!
}
/// 统一获取字体的方法 -- 加粗的
public func FONT_PingFangBold_XMS(fontSize: CGFloat) -> UIFont {
    let font = UIFont.init(name: "Helvetica-Oblique", size: fontSize)
    return font!
}

extension UIFont {
    
    // 自定义的字体 例如： "Helvetica" "PingFangSC-Regular" 等，系统的名字
    class func FontNameWithValue_XMS(name: String, value: CGFloat) -> UIFont {
        return UIFont.init(name: name, size: CGFloat(value))!
    }
    
    /// 加载本地TTF字体
    class func fontWithTTF_XMS(atPath: String, size: CGFloat = 15.0) -> UIFont {
        let foundFile = FileManager.default.fileExists(atPath: atPath);
        if !foundFile {
            return UIFont.systemFont(ofSize: size);
        }
        let fontURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, atPath as CFString?, CFURLPathStyle.cfurlposixPathStyle, false);
        let dataProvider = CGDataProvider.init(url: fontURL!);
        let graphicsFont = CGFont.init(dataProvider!);
        let smallFont = CTFontCreateWithGraphicsFont(graphicsFont!, size, nil, nil);
        return smallFont as UIFont;
    }
}

