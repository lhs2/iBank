//
//  Constants.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright © 2020 Henrique. All rights reserved.
//

import Foundation

struct Constants {
    struct Errors {
        static let generic = "Um erro aconteceu com a requisição. Tente novamente mais tarde."
        static let missingInfo = "Todos os campos precisam ser preenchidos"
    }
    
    struct Service {
        static let baseURL = "https://bank-app-test.herokuapp.com/api/"
        static let login = "login"
        static let signup = "statements/"
    }
    struct Fields {
        static let username = "user"
        static let password = "password"
    }
}
