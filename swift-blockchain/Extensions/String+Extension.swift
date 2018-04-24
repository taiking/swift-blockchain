//
//  String+Extension.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation

extension String {
    var sha256: String { return getSHA256() }
    
    private func getSHA256() -> String {
        var result: [CUnsignedChar]
        let digestLength = 32
        if let cdata = cString(using: String.Encoding.utf8) {
            result = Array(repeating: 0, count: digestLength)
            CC_SHA256(cdata, CC_LONG(cdata.count-1), &result)
        } else {
            result = []
        }
        return (0..<digestLength).reduce("") { $0 + String(format: "%02hhx", result[$1]) }
    }
}
