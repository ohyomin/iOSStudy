//
//  LoginViewController.swift
//  MyFirstiOS
//
//  Created by 오효민 on 2023/02/18.
//

import UIKit

let notificationName = "popup"

class LoginViewController: UIViewController, PopupDeligate {
    
    func onClick() {
        print("onclick")
    }
    
   
    @IBOutlet weak var btnGoMain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        btnGoMain.addTarget(self, action: #selector(moveToMain), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(callback), name: NSNotification.Name(notificationName), object: nil)
    }
    
    @objc fileprivate func callback() {
        
    }
    
    @objc fileprivate func moveToMain() {
//        let mainViewController = MainViewController()
//        self.navigationController?.pushViewController(mainViewController, animated: true)
        let storyBoard = UIStoryboard.init(name: "Popup", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AlertPopup") as! PopupViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        vc.completionClosure = { }
        vc.popupDelegate = self
        self.present(vc, animated: true)
    }
}

