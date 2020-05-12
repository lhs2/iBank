//
//  LoginInteractor.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright (c) 2020 Henrique. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
  func requestLogin(request: Login.Something.Request)
}

protocol LoginDataStore {
  //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker?
  //var name: String = ""
  
  
  func requestLogin(request: Login.Something.Request) {
    worker = LoginWorker()
    worker?.login(credentials: request) { [weak self] response in
        switch response {
        case .success(let response):
            self?.handleSuccess(user: response)
        case .failure(let error):
            self?.presenter?.presentError(message: error.localizedDescription)
        }
        
    }
  }
    
    private func handleSuccess(user: Login.Something.Response) {
        guard let errorMessage = user.error?.message else {
            presenter?.presentSucess(userAccount: user.userAccount)
            return
        }
        presenter?.presentError(message: errorMessage)
    }
}
