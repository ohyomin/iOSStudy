//
//  PopupDialogController.swift
//  MyFirstiOS
//
//  Created by 오효민 on 2023/02/18.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    var completionClosure: (() -> Void)?
    var popupDelegate: PopupDeligate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 30
        btn.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
    }
    
    @IBAction func onSubscribtion(_ sender: UIButton) {
        
        self.dismiss(animated: true)
            
        
        if let callback = completionClosure {
            callback()
        }
    }
    @IBAction func onBtn2(_ sender: UIButton) {
        popupDelegate?.onClick()
    }
    
    @IBAction func onExit(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
