//
//  QuickSort.swift
//  Sort
//
//  Created by ggl on 2019/4/18.
//  Copyright © 2019年 ggl. All rights reserved.
//  快速排序

import Foundation

/// 快速排序
func quickSort(_ array: [Int]) -> [Int] {
    var sortArray = array
    quickSortDecompose(&sortArray, low: 0, high: sortArray.count-1)
    return sortArray
}

/// 分解（分治思想）
///
/// - Parameters:
///   - array: 要排序的数组
///   - p: 数组最小下标
///   - r: 数组最大下标
func quickSortDecompose(_ array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivotKey = partition(&array, low: low, high: high)
        print("array: \(array), pivot Value: \(array[pivotKey])")
        quickSortDecompose(&array, low: low, high: pivotKey-1)
        quickSortDecompose(&array, low: pivotKey+1, high: high)
    }
}

/// 拆分（分治思想）
///
/// - Parameters:
///   - array: 要排序的数组
///   - low: 数组最小下标
///   - high: 数组最大下标
/// - Returns: 关键点pivotKey
func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    var i = low, j = high
    let pivotKey = array[j]
    
    while i < j {
        while i < j && array[i] <= pivotKey {
            i += 1
        }
        array[j] = array[i]
        
        while i < j && array[j] >= pivotKey {
            j -= 1
        }
        array[i] = array[j]
    }
    
    // 将pivotKey的值赋值给i或者j指向的位置（i和j此时指向同一个位置）
    array[i] = pivotKey
    return i
}
