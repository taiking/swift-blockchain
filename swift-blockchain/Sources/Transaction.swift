//
//  Transaction.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation

struct Transaction {
    let sender: String
    let recipient: String
    let amount: Int
    let timestamp: Double
    
    func getHash() -> String {
        let str = sender + recipient + "\(amount)\(timestamp)"
        return str.sha256
    }
}
