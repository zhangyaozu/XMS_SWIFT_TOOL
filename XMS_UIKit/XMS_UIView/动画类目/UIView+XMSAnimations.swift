
//
//  UIView+XMSAnimations.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/10/25.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

/// UIView的动画类目
@objc extension UIView {
    /// 移动动画
    ///
    /// - Parameters:
    ///   - duration: 动画时长
    ///   - delay: 开始延迟时间
    ///   - from: 开始位置
    ///   - to: 结束位置
    ///   - isRepeat: 是否重复
    @objc func moveAnimation_XMS(duration: TimeInterval, delay: TimeInterval = 0.0, from: CGRect, to: CGRect, isRepeat: Bool) {
        let animation = CABasicAnimation(keyPath: "position")
        //开始的位置
        animation.fromValue = NSValue.init(cgPoint: CGPoint.init(x: frame.origin.x + from.width/2.0, y: frame.origin.y + frame.height/2.0))
        //移动到的位置
        animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: to.origin.x + to.width/2.0, y: to.origin.y + to.height/2.0))
        //持续时间
        animation.duration = duration
        //运动后的位置保持不变（layer的最后位置是toValue）
        if isRepeat {
            animation.repeatCount = MAXFLOAT
            animation.isRemovedOnCompletion = false
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.autoreverses = false
        } else {
            animation.repeatCount = 0
        }
        animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeIn)
        //添加动画
        self.layer.add(animation, forKey: "position") // key是可以随便定义的
    }
    
    /// 原地抖动动画
    ///
    /// - Parameter delay: 延迟几秒后开始
    /// - Parameter duration: 动画执行时间
    /// - Parameter isRepeat: 是否重复
    @objc func shakeAnimationDelay_XMS(delay: CGFloat = 0.0, duration: CGFloat, isRepeat: Bool) {
        self.layer.removeAllAnimations() // 移除动画
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = CFTimeInterval(duration) // 动画执行时间
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        if isRepeat {
            animation.repeatCount = MAXFLOAT
            animation.isRemovedOnCompletion = false
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.autoreverses = false
        } else {
            animation.repeatCount = 0
        }
        
        let valueArr = NSMutableArray()
        valueArr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))) // 前两个参数控制大小
        valueArr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1.0))) // 前两个参数控制大小
        valueArr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 1.0))) // 前两个参数控制大小
        valueArr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))) // 前两个参数控制大小
        valueArr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))) // 前两个参数控制大小
        valueArr.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))) // 前两个参数控制大小
        animation.values = valueArr as? [Any]
        animation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.layer.add(animation, forKey: "shakeAnimationDelay") // key是可以随便定义的
    }
}
