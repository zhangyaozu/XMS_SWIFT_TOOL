//
//  UIColor+XMSTool.swift
//  艺库
//
//  Created by zhangmingwei on 2019/8/29.
//  Copyright © 2019 YiKuNetwork. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /// 十六进制
    class func colorRGB16(value: __uint32_t) -> UIColor {
        return UIColor.colorRGB16(value: value, alphe: 1.0);
    }
    /// 十六进制
    class func colorRGB16(value: __uint32_t, alphe: CGFloat) -> UIColor {
        return UIColor.init(red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((value & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((value & 0xFF)) / 255.0,
                            alpha: alphe);
    }
    
    private func RGB_red() -> CGFloat {
        let r = self.cgColor.components
        return r![0];
    }
    
    private func RGB_green() -> CGFloat {
        let g = self.cgColor.components;
        if (self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome) {
            return g![0];
        }
        return g![1];
    }
    
    private func RGB_blue() -> CGFloat {
        let b = self.cgColor.components;
        if (self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome) {
            return b![0];
        }
        return b![2];
    }
    
    private func alpha() -> CGFloat {
        return self.cgColor.alpha;
    }
    
    /// 将颜色转换成16进制的字符串
    func stringForRGB16() -> String {
        let r = Int(self.RGB_red() * 255);
        let g = Int(self.RGB_green() * 255);
        let b = Int(self.RGB_blue() * 255);
        let stringColor = String.init(format: "#%02X%02X%02X", r, g, b);
        return stringColor;
    }
    
}

// MARK: - 色系
extension UIColor {
    /// 纯黑 0x000000 -- 不常用。
    class func getBlackColor_0() -> UIColor {
        return UIColor.colorRGB16(value: 0x000000);
    }
    /// 纯白 0xffffff -- 不常用。
    class func getWhiteColor_0() -> UIColor {
        return UIColor.colorRGB16(value: 0xffffff);
    }
    
    /// 第 1 黑色 333333 - 黑 ： 标题文字的颜色
    class func getBlackColor_1() -> UIColor {
        return UIColor.colorRGB16(value: 0x333333);
    }
    /// 第 2 黑色 0xa4a9b2 - 黑 ： 仅次于标题文字的颜色
    class func getBlackColor_2() -> UIColor {
        return UIColor.colorRGB16(value: 0xa4a9b2);
    }
    /// 第 3 黑色 0xaaaaaa - 黑 ： 最浅的黑色
    class func getBlackColor_3() -> UIColor {
        return UIColor.colorRGB16(value: 0xaaaaaa);
    }
    
    /// 第 1 白的颜色 ： 统一页面背景色 - 浅白色 0xF0F2F6
    class func getWhiteColor_1() -> UIColor {
        return UIColor.colorRGB16(value: 0xF0F2F6);
    }
    
    /// 分割线的颜色 - 0xececec
    class func getSeparatorColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xececec);
    }
    
    /// 获取图片默认的背景色 - 0xececec
    @objc class func getDefaultImageColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xececec);
    }
    
    // ---------------------------------彩色 BEGIN---------------------------------------
    /// 统一的绿色 0x5bd0aa - 统一的绿色
    class func getGreenColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0x5bd0aa);
    }
    /// 获取黄色的颜色 0xFFD806
    class func getYellowColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0xFFD806);
    }
    /// 获取红色的颜色 0xF98C98
    class func getRedColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0xF98C98);
    }
    /// 统一的绿色---左边浅的。
    class func getGreenColorLight() -> UIColor {
        return UIColor.colorRGB16(value: 0x73e9a2)
    }
    /// 统一的绿色---右边深的。
    class func getGreenColorDark() -> UIColor {
        return UIColor.colorRGB16(value: 0x68d8b4)
    }
    /// 浅黄色的背景色（图片加载前的颜色） #F9E0BB
    class func getLightYellowBgColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xF9E0BB)
    }
    /// 进度黄色 0xfdfe21
    class func getProgressYellowColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xfdfe21)
    }
    /// 进度浅灰色 0xebefef
    class func getProgressGrayColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xebefef)
    }
    /// 进度深灰色 colorRGB16(value: 0x000000, alphe: 0.17)
    class func getProgressDarkGrayColor() -> UIColor {
        return UIColor.colorRGB16(value: 0x000000, alphe: 0.17)
    }
    
    // ---------------------------------彩色 END---------------------------------------
}

