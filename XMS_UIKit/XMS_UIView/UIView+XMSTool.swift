
//
//  UIView+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

extension UIView {
    
    /// 获取高斯模糊的view，覆盖到需要的地方就OK了。
    class func getBlurView_XMS(frame: CGRect) -> UIVisualEffectView {
        let blur = UIBlurEffect.init(style: .light)
        let effectView = UIVisualEffectView.init(effect: blur)
        effectView.frame = frame
        return effectView
    }
    
    /// 获取View所在的控制器，响应链上的第一个Controller
    func viewController_XMS() -> UIViewController? {
        var nextResponder = self as UIResponder?;
        
        repeat {
            nextResponder = nextResponder?.next!;
            if nextResponder is UIViewController {
                return nextResponder as? UIViewController;
            }
        }while (nextResponder != nil);
        
        return nil;
    }
    
    /// 清空所有子视图
    func removeAllSubviews_XMS() {
        for view in self.subviews {
            view.removeFromSuperview();
        }
    }
    
    func cornerRadius_XMS(radius: CGFloat) -> UIView {
        self.clipsToBounds = true;
        self.layer.cornerRadius = radius;
        return self;
    }
    
    func borderWidth_XMS(width: CGFloat) -> UIView {
        self.layer.borderWidth = width;
        return self;
    }
    
    func borderColor_XMS(color: UIColor) -> UIView {
        self.layer.borderColor = color.cgColor;
        return self;
    }
    
    /// 视图快照(截图)
    func snapshotImage_XMS() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0);
        self.layer.render(in: (UIGraphicsGetCurrentContext())!);
        let snap = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snap!;
    }
    
    /// 视图快照(截图) --- 固定大小
    func snapshotImageWith_XMS(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, self.isOpaque, 0);
        self.layer.render(in: (UIGraphicsGetCurrentContext())!);
        let snap = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snap!;
    }
    
    ///视图快照(截图) 屏幕会闪下
    func snapshotImageAfterScreenUpdates_XMS(afterUpdates: Bool) -> UIImage {
        if !self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
            return self.snapshotImage_XMS();
        }
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0);
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: afterUpdates);
        let snap = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snap!;
    }
    
    /// 生成快照PDF
    func snapshotPDF_XMS() -> NSData {
        var bounds = self.bounds;
        let data = NSMutableData.init();
        let consumer = CGDataConsumer.init(data: data as CFMutableData);
        let context = CGContext.init(consumer: consumer!, mediaBox: &bounds, nil);
        context?.beginPDFPage(nil);
        context?.translateBy(x: 0, y: bounds.size.height);
        context?.scaleBy(x: 1.0, y: -1.0);
        self.layer.render(in: context!);
        context?.endPDFPage();
        context?.closePDF();
        return data;
    }
}

// MARK: - Frame
extension UIView {
    
    // frame.origin.x
    var x: CGFloat {
        set {
            var rect = self.frame;
            rect.origin.x = newValue;
            self.frame = rect;
        }
        
        get {
            return self.frame.origin.x;
        }
    }
    
    // frame.origin.y
    var y: CGFloat {
        set {
            var rect = self.frame;
            rect.origin.y = newValue;
            self.frame = rect;
        }
        
        get {
            return self.frame.origin.y;
        }
    }
    
    // frame.size.width
    var width: CGFloat {
        set {
            var rect = self.frame;
            rect.size.width = newValue;
            self.frame = rect;
        }
        
        get {
            return self.frame.size.width;
        }
    }
    
    // frame.size.height
    var height: CGFloat {
        set {
            var rect = self.frame;
            rect.size.height = newValue;
            self.frame = rect;
        }
        
        get {
            return self.frame.size.height;
        }
    }
    
    // frame.origin
    var origin: CGPoint {
        set {
            var rect = self.frame;
            rect.origin = newValue;
            self.frame = rect;
        }
        
        get {
            return self.frame.origin;
        }
    }
    
    // frame.size
    var size: CGSize {
        set {
            var rect = self.frame;
            rect.size = newValue;
            self.frame = rect;
        }
        
        get {
            return self.frame.size;
        }
    }
    
    // center.x
    var centerX: CGFloat {
        set {
            var center = self.center;
            center.x = newValue;
            self.center = center;
        }
        
        get {
            return self.center.x;
        }
    }
    
    // center.y
    var centerY: CGFloat {
        set {
            var center = self.center;
            center.y = newValue;
            self.center = center;
        }
        
        get {
            return self.center.y;
        }
    }
    
    // frame.origin.x + frame.size.width
    var right: CGFloat {
        set {
            var rect = self.frame;
            rect.origin.x = newValue - rect.size.width;
            self.frame = rect;
        }
        
        get {
            return self.frame.origin.x + self.frame.size.width;
        }
    }
    
    //
    var bottom: CGFloat {
        set {
            var rect = self.frame;
            rect.origin.y = newValue - rect.size.height;
            self.frame = rect;
        }
        
        get {
            return self.frame.origin.y + self.frame.size.height;
        }
    }
    
    // 左间距
    var leftSpacing: CGFloat {
        set {
            self.x = newValue;
        }
        
        get {
            return self.x;
        }
    }
    
    // 右间距
    var rightSpacing: CGFloat {
        set {
            self.width = (self.superview?.width)! - newValue - self.x;
        }
        
        get {
            return (self.superview?.width)! - self.width - self.x;
        }
    }
    
    // 上间距
    var topSpacing: CGFloat {
        set {
            self.y = newValue;
        }
        
        get {
            return self.y;
        }
    }
    
    // 下间距
    var bottomSpacing: CGFloat {
        set {
            self.height = (self.superview?.height)! - newValue - self.y;
        }
        
        get {
            return (self.superview?.height)! - self.height - self.y;
        }
    }
    
}
