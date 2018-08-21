//
//  Board.swift
//  BoardGameDiceV3
//
//  Created by Wisan Janchot on 25/8/2560 BE.
//  Copyright © 2560 CoalaApps. All rights reserved.
//

import Foundation

class Boad  {
    
    private func addNumberInString(s1: String, s2: String) -> String {
        var totalString = ""
        var carry = 0
        
        var numString1 = s1
        var numString2 = s2
        
        // As manual calculation, longer number should on the top.
        // 1111111110  carry
        //          +
        //  999999999
        //          +
        //  000000001
        // ----------
        // 1000000001
        //
        if numString1.count < numString2.count {
            let temp = numString1
            numString1 = numString2
            numString2 = temp
        }
        
        let lenght = numString1.count
        
        while lenght != numString2.count {
            numString2 = "0" + numString2
        }
        
        for _ in 0..<lenght {
            if let n1 = Int(String(numString1.removeLast())), let n2 = Int(String(numString2.removeLast())) {
                let sum = n1 + n2 + carry
                if sum > 9 {
                    carry = 1
                    totalString = String(sum - 10) + totalString
                } else {
                    carry = 0
                    totalString = String(sum) + totalString
                }
            }
        }
        
        if carry == 1 {
            totalString = "1" + totalString
        }
        
        return totalString
    }
    
    private func addNumberString(in array: String...) -> String {
        var list = array
        var result = "0"
        result = addNumberInString(s1: list.removeFirst(), s2: list.removeFirst())
        while !list.isEmpty {
            result = addNumberInString(s1: result, s2: list.removeFirst())
        }
        return result
    }//end private func addNumberString(in array:[String]) -> String
    
    
    func possibleWay(to n: Int) {
        var n1 = "1"
        var n2 = "2"
        var n3 = "4"
        var n4 = "8"
        var n5 = "16"
        var n6 = "32"
        var result = "0"
        
        switch n {
        case 1:
            result = n1
        case 2:
            result = n2
        case 3:
            result = n3
        case 4:
            result = n4
        case 5:
            result = n5
        case 6:
            result = n6
        default:
            break
        }
        
        if n >= 7 {
            for _ in 7...n {
                result = addNumberString(in: n1, n2, n3, n4, n5, n6)
                n1 = n2
                n2 = n3
                n3 = n4
                n4 = n5
                n5 = n6
                n6 = result
            }
        }
        print("possible ways to \(n):\n \(result)\n")
    }//end func possibleWay(to n: Int) -> String
    
}//end class Board
