//
//  ViewController.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let server = BlockchainServer()
    
    @IBAction func makeTransaction(_ sender: Any) {
        server.send(sender: "senderUserAddress", recipient: "recipientuserAddress", amount: 10)
    }
    
    @IBAction func mining(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {
            self.server.mine(miner: "mininguserAddress")
        }
    }
}

