//
//  RegisterViewController.swift
//  MyFirstiOS
//
//  Created by 오효민 on 2023/02/18.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var btnGoLogin: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onGoLogin(_ sender: UIButton) {
        print("hello'")
        self.navigationController?.popViewController(animated: true)
    }
}
