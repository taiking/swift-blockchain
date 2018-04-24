//
//  Blockchain.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation

let kDifficulty: Int = 4

class Blockchain {
    
    /// make genesis block
    init() {
        let header = BlockHeader(previousHash: "".sha256, markleRoot: "", timestamp: Date().timeIntervalSince1970, difficulty: kDifficulty, nonce: 0)
        let block = Block(header: header, transactions: [])
        createBlock(block: block)
    }
    
    private var currentTransactions: [Transaction] = []
    
    var chain: [Block] = []
    
    func createBlock(block: Block) {
        
        chain.append(block)
        currentTransactions = []
    }
    
    func createTransaction(sender: String, recipient: String, amount: Int) {
        let transaction = Transaction(sender: sender, recipient: recipient, amount: amount)
        currentTransactions.append(transaction)
    }
    
    func proofOfWork() -> Block {
        
        var nonce = 0
        while true {
            if let block = getValidBlock(nonce: nonce) {
                return block
            }
            nonce += 1
        }
    }
    
    func getValidBlock(nonce: Int) -> Block? {
        let header = BlockHeader(previousHash: chain.last!.header.getHash(), markleRoot: "", timestamp: Date().timeIntervalSince1970, difficulty: kDifficulty, nonce: nonce)
        let block = Block(header: header, transactions: currentTransactions)
        let prefix = (0 ..< kDifficulty).reduce("") { i , _ -> String in i + "0" }
        if header.getHash().hasPrefix(prefix) {
            return block
        }
        return nil
    }
}
