
//
//  XMSSizeMacro.swift
//  艺库
//
//  Created by zhangmingwei on 2019/8/29.
//  Copyright © 2019 YiKuNetwork. All rights reserved.
//

/// 尺寸相关的宏定义
import Foundation

/// 屏幕宽度
let kScreenWidth_XMS           = UIScreen.main.bounds.width
/// 屏幕高度
let kScreenHeight_XMS          = UIScreen.main.bounds.height
/// 不同屏幕的比例系数
let kIphone_Default_Scale_XMS  = UIScreen.main.scale

/// iphone不同设备的屏幕密度 ppi
var kIphone_ppi_XMS: CGFloat {
    get {
        if kIs_iphoneX_XMS {
            return 458.0
        }
        if kIs_iphone6P_XMS {
            return 401.0
        }
        return 326.0
    }
}
// 状态栏高度
var kStatusbarHeight_XMS : CGFloat {
    get {
        if kIs_iphoneX_XMS {
            return 20.0 + 24.0
        } else {
            return 20.0
        }
    }
}
/// 导航栏高度 64
var kNavigationbarHeight_XMS: CGFloat {
    get {
        if kIs_iphoneX_XMS {
            return 64.0 + 24.0
        } else {
            return 64.0
        }
    }
}
/// tabbar的高度 49
var kTabbarHeight_XMS: CGFloat {
    get {
        if kIs_iphoneX_XMS {
            return 49.0 + 34.0
        } else {
            return 49.0
        }
    }
}

/// 处理iPhone X 底部的高度：iPhone X页面底部高度为：34.0
var kView_Bottom_Height_XMS: CGFloat {
    get {
        if kIs_iphoneX_XMS {
            return 34.0
        } else {
            return 0.0
        }
    }
}

/// iPhone4
let kIs_iphone4_XMS     =   UIScreen.main.bounds.height == 480
/// iPhone5
let kIs_iphone5_XMS     =   UIScreen.main.bounds.height == 568
/// iPhone6
let kIs_iphone6_XMS     =   UIScreen.main.bounds.height == 667
/// iPhone6P
let kIs_iphone6P_XMS     =   UIScreen.main.bounds.height == 736
/// iPhoneX
let kIs_iphoneX_XMS     =   (UIScreen.main.bounds.height == 812 || UIScreen.main.bounds.height == 896)
/// 特殊适配屏幕的情况 正常按照6的尺寸布局，适配一下6P和X的情况
let kScreenRatio_XMS: CGFloat  =    ((kIs_iphone6P_XMS || kIs_iphoneX_XMS) ? (414.0/375.0) : 1)
/// 是否是ipad
let kIs_ipad_XMS        =   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)

// iOS系统版本
let kIs_iOS8_XMS = (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
let kIs_iOS9_XMS = (UIDevice.current.systemVersion as NSString).doubleValue >= 9.0
let kIs_iOS10_XMS = (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0
let kIs_iOS11_XMS = (UIDevice.current.systemVersion as NSString).doubleValue >= 11.0
let kIs_iOS12_XMS = (UIDevice.current.systemVersion as NSString).doubleValue >= 12.0
let kIs_iOS13_XMS = (UIDevice.current.systemVersion as NSString).doubleValue >= 13.0
