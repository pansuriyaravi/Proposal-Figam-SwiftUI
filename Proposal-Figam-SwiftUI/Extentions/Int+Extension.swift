////
//  Int+Extension.swift
//  bug-free-goggles
//
//  Created by Mac on 10/05/23.
//

import Foundation

extension Int {
    var twoDigitString: String {
        String(format: "%02d", self)
    }
    
    var twoDecimalString: String {
        String(format: "%.2f", self)
    }
}
