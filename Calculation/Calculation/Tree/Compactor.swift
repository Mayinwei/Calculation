//
//  Compactor.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/20.
//  Copyright © 2020 Ma. All rights reserved.
//  比较器

import UIKit

protocol Compactor {
    //解释Suffix 必须遵守SuffixableContainer这个协议，以及Suffix中的Item必须Comparable的Item（也就是T必须是一个类型）
//    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    associatedtype T
    func compareTo(element2:T) -> Int
}

extension  Int :Compactor{
    func compareTo(element2: Int) -> Int {
        return 0
    }
    
    typealias T = Int
}
