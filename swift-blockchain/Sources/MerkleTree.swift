//
//  MerkleTree.swift
//  swift-blockchain
//
//  Created by 辻林 大揮 on 2018/04/24.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation


indirect enum MerkleTree {
    
    case empty
    case node(hash: String, left: MerkleTree, right: MerkleTree)
    
    func getRootHash() -> String {
        switch self {
        case let .node(hash, _, _):
            return hash
        default:
            return ""
        }
    }
    
    init(hash: String) {
        self = MerkleTree.node(hash: hash, left: .empty, right: .empty)
    }
}

extension MerkleTree {
    
    static func create(parent left: MerkleTree, right: MerkleTree) -> MerkleTree {
        var leftHash  = ""
        var rightHash = ""
        
        switch left {
        case let .node(hash, _, _):
            leftHash = hash
        case .empty:
            break
        }
        
        switch right {
        case let .node(hash, _, _):
            rightHash = hash
        case .empty:
            break
        }
        
        let newHash = (leftHash + rightHash).sha256
        return MerkleTree.node(hash: newHash, left: left, right: right)
    }
    
    static func build(from hashes: [String]) -> MerkleTree {
        
        var nodes: [MerkleTree] = []
        
        for hash in hashes {
            nodes.append(MerkleTree(hash: hash))
        }
        
        while nodes.count != 1 {
            var tmpArray = [MerkleTree]()
            while nodes.count > 0 {
                
                let leftNode  = nodes.removeFirst()
                let rightNode = nodes.count > 0 ? nodes.removeFirst() : leftNode
                
                tmpArray.append(create(parent: leftNode, right: rightNode))
            }
            nodes = tmpArray
        }
        return nodes.first!
    }
}
