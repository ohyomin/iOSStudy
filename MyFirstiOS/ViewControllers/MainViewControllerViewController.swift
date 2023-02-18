//
//  ViewController.swift
//  MyFirstiOS
//
//  Created by 오효민 on 2023/02/16.
//

import UIKit
import KRProgressHUD

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "main"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label
    }()
    
    var myBG: Bool = true
    
    private lazy var changeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("change", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets(
            top: 5,
            left: 5,
            bottom: 5,
            right: 5
        )
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        return btn
    }()
    
    @objc func onClick() {
        KRProgressHUD.show()
        sayHi { result in
            print("from complete \(result)")
            KRProgressHUD.showSuccess()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.orange
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(changeBtn)
        
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        changeBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc fileprivate func changeBG() {
        if myBG {
            view.backgroundColor = UIColor.orange
        } else {
            view.backgroundColor = UIColor.red
        }
        myBG = !myBG
    }
    
    @objc fileprivate func sayHi(completion: @escaping(String) -> ()) {
        print("hmhm")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion("complete")
        }
    }
}

