//
//  BaseViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/10/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var messageObject:Any!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    /// Function for make custom button with corner radius and shadow
    ///
    /// - Parameter button: UIButton which will customize
    func customButton(button: UIButton) {
        button.layer.cornerRadius = 3.0
        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.masksToBounds = false
    }
    
    
    /// Function for make navigation transparant
    func setNavigationTransparent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    
    /// Create default alert controller
    ///
    /// - Parameters:
    ///   - controller: controller the calling this function
    ///   - title: title for alert
    ///   - message: message for alert
    ///   - okFunction: ok action for alert
    ///   - cancelFunction: cancel action for alert
    func showAlert(_ controller: UIViewController, title: String, message: String, okFunction: (() -> Void)?, cancelFunction: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            if okFunction != nil {
                okFunction!()
            }else {
                self.dismissFunction()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        if cancelFunction != nil {
            alertController.addAction(cancelAction)
        }
        controller.present(alertController, animated: true, completion: nil)
    }
    
    func dismissFunction(){
        if self.navigationController?.viewControllers[0] == self{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.view.endEditing(true)
            _=self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    /// Present new controller from controller
    ///
    /// - Parameter controller: controller destination
    func pushViewController(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
