//
//  LoginPresenter.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright (c) 2020 Henrique. All rights reserved.

import UIKit

protocol LoginPresentationLogic {
  func presentSucess(userAccount: Login.Something.UserAccount?)
  func presentError(message: String)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentSucess(userAccount: Login.Something.UserAccount?) {
        if let user = userAccount {
            let viewModel = Login.Something.ViewModel(userAccount: user)
            viewController?.displaySomething(viewModel: viewModel)
        }
    }
    
    func presentError(message: String) {
        let viewModel = Login.Something.ViewModel(message: message)
        viewController?.displaySomething(viewModel: viewModel)
    }
    
  
}
