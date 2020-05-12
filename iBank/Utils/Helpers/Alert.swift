//
//  Alert.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright © 2020 Henrique. All rights reserved.
//

import UIKit

class Alert {
    func msg(message: String, title: String = "Erro encontrado") {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertView.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))

        let currentTopVC: UIViewController? = self.currentTopViewController()

        guard let topVC = currentTopVC else { return }
        topVC.present(alertView, animated: true, completion: nil)
    }
    
    func currentTopViewController() -> UIViewController? {
        guard let delegate = UIApplication.shared.delegate,
            let window = delegate.window,
            var topVC = window?.rootViewController else { return nil}
        while ((topVC.presentedViewController) != nil) {
            topVC = topVC.presentedViewController!
        }
        return topVC
    }
}
