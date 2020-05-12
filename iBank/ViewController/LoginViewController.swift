//
//  LoginViewController.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright (c) 2020 Henrique. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var alert: Alert = Alert()
    var vSpinner : UIView?

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
        let activityIndicator = UIActivityIndicatorView.init(style: .medium)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        if(vSpinner != nil) {
                vSpinner?.removeFromSuperview()
                vSpinner = nil
          }
    }
    
    
    @IBAction func performLogin(_ sender: Any) {
        if let user = userTextField.text,
            let password = passwordTextField.text,
            !user.isEmpty,
            !password.isEmpty {
            showSpinner(onView: self.view)
            requestLogin(user: user, password: password)
        } else {
            alert.msg(message: Constants.Errors.missingInfo)
        }
    }
    
    func requestLogin(user: String, password: String) {
        let request = Login.Something.Request(user: user, password: password)
        interactor?.requestLogin(request: request)
    }
    
    func displaySomething(viewModel: Login.Something.ViewModel) {
        removeSpinner()
        if viewModel.message.isEmpty {
            
        } else {
            let alert = Alert()
            alert.msg(message: viewModel.message)
        }
    }
}
