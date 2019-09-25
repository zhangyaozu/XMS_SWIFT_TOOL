
//
//  UIScrollView+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

extension UIScrollView {
    /// 滚到顶点
    func scrollToTop_XMS(animated: Bool) {
        var off = self.contentOffset;
        off.y = 0 - self.contentInset.top;
        self.setContentOffset(off, animated: animated);
    }
    
    /// 滚到底边
    func scrollToBottom_XMS(animated: Bool) {
        var off = self.contentOffset;
        off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
        self.setContentOffset(off, animated: animated);
    }
    
    /// 滚到左边
    func scrollToLeft_XMS(animated: Bool) {
        var off = self.contentOffset;
        off.x = 0 - self.contentInset.left;
        self.setContentOffset(off, animated: animated);
    }
    
    /// 滚到右边
    func scrollToRight_XMS(animated: Bool) {
        var off = self.contentOffset;
        off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
        self.setContentOffset(off, animated: animated);
    }
}
