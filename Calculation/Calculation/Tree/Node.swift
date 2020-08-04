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
    
    /// 是否为叶子节点
    /// - Returns: 结果
    func isLeaf() -> Bool {
        return self.left==nil && self.right==nil
    }
    
    
    /// 拥有两个子节点
    /// - Returns: 结果
    func haveTowChildren() -> Bool {
        return self.left != nil && self.right != nil
    }
    
    /// 判断节点是否为父节点的左边
    /// - Returns: 是否为左节点
    func isLeftChild() -> Bool {
        return parent != nil && self == parent?.left
    }
    
    /// 判断节点是否为父节点的右边
    /// - Returns: 是否为右节点
    func isRightChild() -> Bool {
        return parent != nil && self == parent?.right
    }
}
