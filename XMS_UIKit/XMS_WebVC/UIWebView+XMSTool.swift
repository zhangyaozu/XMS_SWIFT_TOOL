//
//  UIWebView+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation
import JavaScriptCore

// MARK: - HTML
extension UIWebView {
    
    /// 获取当前网页的Url字符串
    func currentWebUrlString_XMS() -> String {
        return self.stringByEvaluatingJavaScript(from: "document.location.href")!;
    }
    
    /// 获取当前网页的标题
    func currentWebTitle_XMS() -> String {
        return self.stringByEvaluatingJavaScript(from: "document.title")!;
    }
    
    /// 获取当前网页的所有图片地址
    func currentWebAllImageUrlArray_XMS() -> Array<String> {
        let allImageURL = self.stringByEvaluatingJavaScript(from: "var imgArray = document.getElementsByTagName('img'); var imgstr = ''; function f(){ for(var i = 0; i < imgArray.length; i++){ imgstr += imgArray[i].src;imgstr += ';';} return imgstr; } f();")!
        let imageURLArray = allImageURL.components(separatedBy: ";");
        return imageURLArray;
    }
    
    /// 获取当前网页的图片数量
    func currentWebImageNumber_XMS() -> Int {
        let imageNumber = self.stringByEvaluatingJavaScript(from: "var imgArray = document.getElementsByTagName('img');function f(){ var num=imgArray.length;return num;} f();");
        return (imageNumber as NSString?)!.integerValue;
    }
    
    /// 修改网页的背景颜色
    func changeWebBackgroundColor_XMS(color: UIColor) {
        self.stringByEvaluatingJavaScript(from: "document.body.style.backgroundColor = '\(color.stringForRGB16())'")
    }
}

var kXMSJavaScript_JSContext = "kXMSJavaScript_JSContext";

// MARK: - JavaScriptCore
extension UIWebView {
    
    var context: JSContext {
        get{
            var c: JSContext? = objc_getAssociatedObject(self, &kXMSJavaScript_JSContext) as? JSContext;
            if (c == nil) {
                c = self.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext; // 获取web的JavaScript的环境
                objc_setAssociatedObject(self, &kXMSJavaScript_JSContext, c, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return c!;
        }
    };
    
    
    //    func javaScript(callback: String, achieved:@escaping (Array<Any>) -> Void) {
    //        self.context[callback] = {
    //            let
    //        }();
    //    }
}
