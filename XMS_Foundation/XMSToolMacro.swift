//
//  XMSToolMacro.swift
//  艺库
//
//  Created by zhangmingwei on 2019/8/29.
//  Copyright © 2019 YiKuNetwork. All rights reserved.
//

import Foundation

/// 网络断开的统一提示文字
let  kNetworkErrorTipStr_XMS       =   "网络连接断开,请检查网络"
/// 请求失败统一的提示文字
let kRequestFailureTipStr_XMS      =     "加载失败，请稍后重试"


//MARK:公共方法
/// 自定义Log
///
/// - Parameters:
///   - messsage: 正常输出内容
///   - file: 文件名
///   - funcName: 方法名
///   - lineNum: 行数
func XMLogSwift<T>(_ messsage: T, time: NSDate = NSDate(), file: String = #file, funcName: String = #function, lineNum: Int = #line) {
    let fileName = (file as NSString).lastPathComponent
    /// 会打印出log的时间，类名，和行数。
    print("\(time):\(fileName):(\(lineNum))======>>>>>>\n\(messsage)")
}

/// 当前语言是否是中文 ture or false
let kLanguage_is_chinese_xm = NSLocale.preferredLanguages[0].hasPrefix("zh")
// Locale String [Upper Case]
// 英文-香港    EN_HK
// 中文-香港    ZH_HK
// 英文-中国    EN_CN
// 英文-台湾    EN_TW
// 英文-澳门    EN_MO
let kLocal_string_upper_case_xm = NSLocale.current.identifier.uppercased()
// 在非中国的海外地区 - 是否是： 非大陆地区
let kArea_out_China_neidi_xm = (!kLocal_string_upper_case_xm.hasSuffix("CN") || kLocal_string_upper_case_xm.hasSuffix("HK") || kLocal_string_upper_case_xm.hasSuffix("TW") || kLocal_string_upper_case_xm.hasSuffix("MO"))

/// 当前版本号： 例如：2.6.1
let kCurrentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
/// 当前的 CFBundleIdentifier
let kCFBundleIdentifier = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
