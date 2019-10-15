//
//  UIAlertController+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/29.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

/// 三步完成 alert/actionSheet的框。
@objc extension UIAlertController {
    /// MARK: 初始化AlertController - 第一步
    @objc  public class func initAlertC(title: String?, msg: String?, style: UIAlertController.Style) -> UIAlertController {
        let vc = UIAlertController(title: title, message: msg, preferredStyle: style)
        return vc
    }
    /// 添加相关的按钮 - 第二步
    @objc  public func addMyAction(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
        
    }
    /// 弹出AlertV - 第三步
    @objc  public func showAlertC(vc: UIViewController!, completion: (() -> Void)?) {
        if kIs_ipad_XMS { // iPad 需要特殊处理    ------- actionSheet的时候不处理iPad就崩溃
            self.popoverPresentationController?.sourceView = UIApplication.shared.keyWindow
            self.popoverPresentationController?.sourceRect =  CGRect.init(x: kScreenWidth_XMS/2.0 - 10, y: kScreenHeight_XMS/2.0 - 10, width: 1, height: 1)
            vc.present(self, animated: true, completion: nil)
        } else {
            vc.present(self, animated: true, completion: completion)
        }
        self.changeBgColor(bgColor: UIColor.white)
    }
    /// 弹出AlertV - 第三步  actionSheet并且需要适配pad的情况.     sourceFrame : pad的时候，弹出的初始位置(pad强迫必须有，否则崩溃)
    @objc  public func showAlertCWithSourceView(sourceFrame:CGRect, vc: UIViewController!, completion: (() -> Void)?) {
        if kIs_ipad_XMS { // iPad 需要特殊处理 actionSheet 的时候需要
            self.popoverPresentationController?.sourceView = UIApplication.shared.keyWindow
            self.popoverPresentationController?.sourceRect =  sourceFrame
            vc.present(self, animated: true, completion: nil)
        } else {
            vc.present(self, animated: true, completion: completion)
        }
        self.changeBgColor(bgColor: UIColor.white)
    }
    
    /// 自定义控件的背景色   ---- iOS13黑暗模式的时候，可能会用到  bgIsLight : 是否背景是浅色的，默认是浅色的
    @objc public func changeBgColor(bgColor: UIColor, bgIsLight:Bool = true) {
        var titleColor = UIColor.white  // title颜色
        var msgColor   = UIColor.white  // message颜色
        
        if bgIsLight == true { // 修改标题颜色
            titleColor = UIColor.black
            msgColor = UIColor.black
        } else {
            titleColor = UIColor.white
            msgColor = UIColor.white
        }
        
        // 标题颜色
        let titleStr: NSMutableAttributedString = NSMutableAttributedString.init(string: self.title ?? "")
        titleStr.addAttributes([.foregroundColor:titleColor], range: NSMakeRange(0,self.title?.length ?? 0))
        self.setValue(titleStr, forKey: "attributedTitle")
        let msgStr: NSMutableAttributedString = NSMutableAttributedString.init(string: self.message ?? "")
        msgStr.addAttributes([.foregroundColor:msgColor], range: NSMakeRange(0,self.message?.length ?? 0))
        self.setValue(msgStr, forKey: "attributedMessage")
        
        // 按钮的背景色
        let FirstSubview = self.view.subviews.first
        let AlertContentView = FirstSubview?.subviews.first
        for subview in (AlertContentView?.subviews)! {
            subview.backgroundColor = bgColor
            subview.layer.cornerRadius = 10
            subview.alpha = 1
        }
    }
}
