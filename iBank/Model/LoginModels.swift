//
//  LoginModels.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright (c) 2020 Henrique. All rights reserved.
//

import UIKit

enum Login {
  // MARK: Use cases
  
  enum Something {
    struct Request: Codable {
        var user: String
        var password: String
    }
    
    struct Response: Codable {
        var userAccount: UserAccount?
        var error: ErrorAccount?
    }
    
    struct UserAccount: Codable {
        var userId: Int?
        var name: String?
        var bankAccount: String?
        var agency: String?
        var balance: Float?
    }
    
    struct ErrorAccount: Codable {
        var code: Int?
        var message: String?
    }
    
    struct ViewModel {
        var message: String = ""
        var userAccount: UserAccount = UserAccount()
    }
  }
}
