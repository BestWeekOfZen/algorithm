//
//  RecursionFunc.swift
//  Recursion
//
//  Created by ggl on 2019/4/15.
//  Copyright © 2019年 ggl. All rights reserved.
//

import Foundation

/*
 假如这里有 n 个台阶，每次你可以跨 1 个台阶或者 2 个台阶，请问走这 n 个台阶有多少种走法？
 */

/// 递归计算n个台阶的走法
///
/// - Parameter total: 台阶的总数
/// - Returns: 总走法
var stepInfo = [Int: Int]()
func calculateSteps(_ total: Int) -> Int {
    // 一个台阶之后一种走法：走一步
    if total == 1 {
        return 1
    }
    
    // 两个台阶有两种走法：一次走两步或者一次走一步
    if total == 2 {
        return 2
    }
    
    // 解决重复计算的问题
    if stepInfo.keys.contains(total) {
        return stepInfo[total]!
    }
    
    let result = calculateSteps(total-1) + calculateSteps(total-2)
    stepInfo[total] = result
    
    return result
}

/// 非递归计算n个台阶的走法
///
/// - Parameter total: 台阶的总数
/// - Returns: 总走法
func calculateStepsNoRecursion(_ total: Int) -> Int {
    if total == 1 {
        return 1
    }
    
    if total == 2 {
        return 2
    }
    
    // f(n) = f(n-1) + f(n-2)，prepare代表f(n-1)，pre代表f(n-2)
    var result = 0
    var prepare = 1
    var pre = 2
    for _ in 3...total {
        result = pre + prepare
        prepare = pre
        pre = result
    }
    return result
}

/*
 总结：递归代码需要注意的问题：
        1.堆栈溢出（递归层次较深）（通过限制递归深度解决）
        2.重复计算（通过字典保存上一次计算结果解决）
        3.递归死循环（通过散列表检测环的存在）
        4.空间复杂度高（尾递归解决）
 */
