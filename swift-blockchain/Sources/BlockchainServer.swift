//
//  BlockchainServer.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation

class BlockchainServer {
    
    let blockchain = Blockchain()
    
    func send(sender: String, recipient: String, amount: Int) {
        blockchain.createTransaction(sender: sender, recipient: recipient, amount: amount)
    }
    
    func mine(miner: String){
        let block = blockchain.proofOfWork()
        
        blockchain.createBlock(block: block)
        
        blockchain.createTransaction(sender: "", recipient: miner, amount: 1)
    }
}
