//
//  AuthViewController.swift
//  VKNewsLite
//
//  Created by Виктор on 23.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared().authService
    }
    
    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
}
