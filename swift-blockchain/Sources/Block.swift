//
//  Block.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation

struct BlockHeader {
    let previousHash: String
    let markleRoot: String
    let timestamp: Double
    let difficulty: Int
    var nonce: Int
    
    func getHash() -> String {
        let header = previousHash + markleRoot + "\(Int(timestamp))\(difficulty)\(nonce)"
        return header.sha256
    }
}

struct Block {
    var header: BlockHeader
    let transactions: [Transaction]
    var transactionCount: Int {
        return transactions.count
    }
}
