//
//  Node.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/19.
//  Copyright © 2020 Ma. All rights reserved.
//

import UIKit

class Node<T>: NSObject {
    
    var element:T?//元素
    var left:Node?//左子节点
    var right:Node?//右子节点
    var parent:Node?//父节点
    
    init(element:T,parent:Node?) {
        self.element=element
        self.parent=parent
    }
    
    override class func description() -> String {
        return "ddddddd"
    }
}
