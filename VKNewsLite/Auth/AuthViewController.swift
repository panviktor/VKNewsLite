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
    
    @IBOutlet var signInButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared().authService
        setupGUI()
    }
    
    fileprivate func setupGUI() {
        signInButton.alpha = 0.9
        signInButton.layer.cornerRadius = 10
        signInButton.clipsToBounds = true
    }
    
    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    
    
}
