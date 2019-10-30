//
//  XMSReviewAlertView.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/10/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import UIKit
import StoreKit

let kLaunchCountSetting = "kNumberOfLaunch"  // 用于存储运行次数的 UserDefauls 字典键
let kMinimumLaunchCount = 3 // 询问评分的最少运行次数

/*
    使用方法：
    第一步：启动APP的时候，调用：XMSReviewAlertView.addAppLaunchCount_XMS()
    第二步：需要弹出的页面，调用：XMSReviewAlertView.showReview_XMS()
 */

/// 应用内评价弹出框  ---- 使用方法，共两步
@objc class XMSReviewAlertView: NSObject {

    /// 第一步：启动APP的次数统计（共两边）
    @objc class func addAppLaunchCount_XMS() { // app 运行次数计数器。可以在 App Delegate 中调用此方法
        let runs = XMSReviewAlertView.getLaunchCount_XMS() + 1
        UserDefaults.standard.setValuesForKeys([kLaunchCountSetting: runs])
        UserDefaults.standard.synchronize()
    }
    
    /// 第二步 ：弹出评价框 （共两步）
    @objc class func showReview_XMS() {
        let runs = XMSReviewAlertView.getLaunchCount_XMS()
        print("显示评分")
        if (runs > kMinimumLaunchCount) {
            if #available(iOS 10.3, *) {
                print("已请求评分")
                /// 每年最多会弹出3次，放心调用就OK了。
                SKStoreReviewController.requestReview()
            } else {
                // 回到老版本
            }
        } else {
            print("请求评分所需的运行次数不足！")
        }
    }
    
   class func getLaunchCount_XMS() -> Int {   // 从 UserDefaults 里读取运行次数并返回。
        let savedRuns = UserDefaults.standard.value(forKey: kLaunchCountSetting)
        var runs = 0
        if (savedRuns != nil) {
            runs = savedRuns as! Int
        }
        print("已运行\(runs)次")
        return runs
    }
}
