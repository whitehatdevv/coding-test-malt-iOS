//
//  Constants.swift
//  TestingCode
//
//  Created by Martinez, Emanuele on 30/11/21.
//

import Foundation

/// Static data used during the app
struct Constants {
    
    struct kXIBFiles {
        static let kMainView = "MainView"
    }
    
    struct kCells {
        static let kMainCell = "MainCell.identifier.id"
        struct kCellsXIB {
            static let kMainCell = "MainTableViewCell"
        }
    }
    
    struct kAPI {
        static let kBasicURL = "https://code-challenge-e9f47.web.app/"
        struct kEndpoints {
            static let kTransactions = "transactions.json"
        }
    }
    
}
