//
//  Tip.swift
//  Swift03-tip-calculator
//
//  Created by shinwood on 5/7/16.
//  Copyright © 2016 guox.in. All rights reserved.
//

import Foundation

class Tip {
    var tipRate: Double
    
    init(){
         tipRate = 0.15
    }
    
    func calculateTip (valueToPay: Double) -> Double {
        let tipValue = valueToPay * tipRate
        return tipValue
    }
}
