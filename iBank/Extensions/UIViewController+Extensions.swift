//
//  UIViewController+Extensions.swift
//  iBank
//
//  Created by Henrique on 11/05/20.
//  Copyright © 2020 Henrique. All rights reserved.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
