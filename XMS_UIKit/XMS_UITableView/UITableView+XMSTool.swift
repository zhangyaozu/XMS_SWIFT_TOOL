//
//  UITableView+XMSTool.swift
//  artreeIOS
//
//  Created by zhangmingwei on 2019/8/30.
//  Copyright © 2019 yiku. All rights reserved.
//

import Foundation

extension UITableView {
    
    public class func getTableView_XMS(frame: CGRect, style: UITableView.Style? = nil ) -> UITableView {
        var tableV:UITableView
        if style == nil {
            tableV = UITableView.init(frame: frame, style: .plain)
        } else {
            tableV = UITableView.init(frame: frame, style: style!)
        }
        
        tableV.separatorColor = UIColor.getSeparatorColor()
        //        tableView.separatorStyle = .singleLine
        //        tableView.separatorColor = UIColor.getSeparator()
        //        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableV.separatorInset = .zero
        tableV.tableFooterView = UIView()
        tableV.tableHeaderView = UIView()
        // iOS11后，不加这三句，会出现，reloadData的时候页面闪动，滚动到其他地方的bug。
        tableV.estimatedRowHeight = 0
        tableV.estimatedSectionHeaderHeight = 0
        tableV.estimatedSectionFooterHeight = 0
        
        return tableV
    }
}
