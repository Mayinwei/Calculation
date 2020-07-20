//
//  Comparable.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/20.
//  Copyright © 2020 Ma. All rights reserved.
//

import UIKit

protocol Comparable {
//    associatedtype Item: Equatable  //表示Item类必须遵守Equatable协议
    associatedtype T
    func compareTo(_ e:T)->Int
}
