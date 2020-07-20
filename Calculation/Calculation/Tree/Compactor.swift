//
//  Compactor.swift
//  Calculation
//
//  Created by 魏庆洁 on 2020/7/20.
//  Copyright © 2020 Ma. All rights reserved.
//  比较器

import UIKit

protocol Compactor {
    associatedtype T
    func compare(e1:T,e2:T) -> Int 
}
