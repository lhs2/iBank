//
//  LoginWorker.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright (c) 2020 Henrique. All rights reserved.
//

import UIKit
import Alamofire

protocol LoginWorkerProtocol: class {
    func login(credentials: Login.Something.Request, completion:@escaping (AFResult<Login.Something.Response>) -> Void)
}


class LoginWorker: LoginWorkerProtocol
{
    var manager: BaseWorker = BaseWorker()
    
    func login(credentials: Login.Something.Request, completion: @escaping (AFResult<Login.Something.Response>) -> Void) {
        manager.createRequest(route: API.login(username: credentials.user, password: credentials.password), completion: completion)
    }
}
