//
//  AVLTree.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/8/3.
//  Copyright © 2020 Ma. All rights reserved.
//  是一种自平衡的树，每个节点的平衡因子 是 0 -1 1

import UIKit

class AVLTree<T:Compactor>:BinarySearchTree<T> {
    
    //计算平衡
    override func afterAdd(node: Node<T>) {
        var node1=node.parent
        while node1 != nil {
            node1=node1?.parent
            
            //判断是否平衡
            if isBalance(node: node) {
                //更新高度
                (node as! AVLNode<T>).updateHeight()
            }else{
                //恢复平衡
                reBalance(node)
                break
            }
        }
    }
    
    override func createNode(element:T,parent:Node<T>?) -> Node<T> {
        return AVLNode(element: element, parent: parent)
    }
    
    //该节点是否平衡
    private func isBalance(node:Node<T>) -> Bool {
        return abs((node as! AVLNode<T>).balanceFactor()) <= 1
    }
    
    /// 重新调整节点，达到平衡
    /// - Parameter node: 节点
    private func reBalance(_ grand:Node<T>){
        let parent=(grand as! AVLNode<T>).tallerHeight()
        let node=(parent as! AVLNode<T>).tallerHeight()
        
        if parent.isLeftChild() {
            if node.isLeftChild() {
                //LL
                rotateRight(parent)
            }else{
                //LR
                rotateLeft(parent)
                rotateRight(grand)
            }
        }else{
            if node.isLeftChild() {
                //RL
                rotateRight(parent)
                rotateLeft(grand)
            }else{
                //RR
                rotateLeft(parent)
            }
        }
    }
    
    /// 左旋转
    /// - Parameter node: 旋转节点
    private func rotateLeft(_ node:Node<T>){
        
    }
    
    /// 右旋转
    /// - Parameter node: 旋转节点
    private func rotateRight(_ node:Node<T>){
        
    }
}



/// AVL树节点
class AVLNode<T>: Node<T> {
    var height:Int=1
    
    //计算平衡因子
    func balanceFactor() -> Int {
        let leftHeight = left == nil ? 0: (left as! AVLNode<T>).height
        let rightHeight = left == nil ? 0: (left as! AVLNode<T>).height
        return leftHeight - rightHeight
    }
    
    /// 更新节点高度
    func updateHeight(){
        let leftHeight = left == nil ? 0: (left as! AVLNode<T>).height
        let rightHeight = left == nil ? 0: (left as! AVLNode<T>).height
        
        height=max(leftHeight, rightHeight)+1
    }
    
    /// 获取最高的节点
    /// - Returns: 节点
    func tallerHeight() -> Node<T> {
        let leftHeight = left == nil ? 0: (left as! AVLNode<T>).height
        let rightHeight = left == nil ? 0: (left as! AVLNode<T>).height
        
        if leftHeight > rightHeight {
            return left!
        }
        
        if leftHeight < rightHeight {
            return right!
        }
        if isLeftChild() {
            return left!
        }else{
            return right!
        }
        
    }
    
    
}
