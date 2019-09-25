//
//  String+XMSToolSwift.swift
//  艺库
//
//  Created by zhangmingwei on 2019/8/29.
//  Copyright © 2019 YiKuNetwork. All rights reserved.
//

import Foundation

extension String {
    /// 以下这几种情况都认为的空
    public static func isEmptyString(str: String?) -> Bool {
        if str == nil {
            return true
        } else if (str == "") {
            return true
        } else if (str == "<null>") {
            return true
        } else if (str == "(null)") {
            return true
        } else if (str == "null") {
            return true
        }
        return false
    }
}
