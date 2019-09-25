//
//  XMSWebVC.swift
//  艺库
//
//  Created by zhangmingwei on 2019/8/29.
//  Copyright © 2019 YiKuNetwork. All rights reserved.
//

import UIKit
import WebKit
/// 屏幕宽度
let kXMS_WebVC_ScreenWidth            = UIScreen.main.bounds.width
/// 屏幕高度
let kXMS_WebVC_kScreenHeight          = UIScreen.main.bounds.height

/// 统一的 webViewController 这里可以继承您的BaseViewController
class XMSWebVC: BaseViewController, WKNavigationDelegate {

    var titleStr: String? // 当前页面的标题
    var urlStr: String? // 网络的url
    public var localPathStr: String? // 本地地址
    
    var webView: WKWebView!
    var urlRequest: URLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加标题
        self.navigationItem.title = titleStr
        // 初始化webView和进度条
        self.initWebViewAndProgressV()
        // 加载网页
        self.loadUrlRequest()
    }
    
    // 加载webView和进度条
    func initWebViewAndProgressV() {
        // WKWebView自适应文字大小
        let js = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        //        let wkUserScript = WKUserScript.init(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let wkUserScript = WKUserScript.init(source: js, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        
        let wkController = WKUserContentController()
        wkController.addUserScript(wkUserScript)
        let wkConfig = WKWebViewConfiguration()
        wkConfig.userContentController = wkController
        webView = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: kXMS_WebVC_ScreenWidth, height: kXMS_WebVC_kScreenHeight), configuration: wkConfig)
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.allowsBackForwardNavigationGestures = true
        // 添加进度条
        webView.addProgressView()
        // 监听title （其实进度和title都是用监听获取的）
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
    
    // 监听title的回调
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "title") {
            if !String.isEmptyString(str: self.webView.title) && String.isEmptyString(str: self.titleStr) {
                self.navigationItem.title = self.webView.title
            }
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "title")
    }
    
    // 加载页面
    func loadUrlRequest() {
        if !String.isEmptyString(str: urlStr) {
            if let url = URL.init(string: urlStr!) {
                self.urlRequest = URLRequest.init(url: url)
                webView.load(self.urlRequest!)
            } else {
//                                ProgressHUD.showTitle("网页错误")
//                                RouterTool.popToRootVC(isToRootVC: false)
            }
        } else if (!String.isEmptyString(str: localPathStr)) {
            let path = Bundle.main.path(forResource: localPathStr!, ofType: "html")
            if let path = path {
                let fileUrl = URL.init(fileURLWithPath: path)
                if #available(iOS 9.0, *) {
                    webView.loadFileURL(fileUrl, allowingReadAccessTo: fileUrl)
                }
            }
        }
    }
}
