//
//  LoginViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/10/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    var checkBoxClick = false
    override func viewDidLoad() {
        super.viewDidLoad()

        checkBoxView.layer.borderColor = UIColor.gray.cgColor
        checkBoxView.layer.borderWidth = 0.3
        checkBoxView.layer.masksToBounds = false
        customButton(button: loginButton)
        customButton(button: signupButton)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickCheckBox))
        checkBoxView.addGestureRecognizer(tapGesture)
        checkMarkImage.isHidden = true
        checkMarkImage.isUserInteractionEnabled = false
        setNavigationTransparent()
        
        usernameTF.text = "apit.gilang@appschef.com"
        passwordTF.text = "12345678"
        
        // Do any additional setup after loading the view.
    }
    
    @objc func onClickCheckBox() {
        if checkBoxClick {
            checkBoxClick = false
            checkMarkImage.isHidden = true
        }else {
            checkBoxClick = true
            checkMarkImage.isHidden = false
        }
    }
    
    private func validateForm() -> String {
        var errorMessage = ""
        if (usernameTF.text?.count)! < 3 {
            errorMessage = "Username minimal input is 3 character"
        }else if Configuration.checkWithRegex(text: usernameTF.text, regex: Configuration.REGEX_EMAIL) {
            errorMessage = "Username / Email format is incorect"
        }else if (passwordTF.text?.count)! < 3 {
            errorMessage = "Password minimal input is 3 character"
        }
        return errorMessage
    }

    @IBAction func onClickLogin(_ sender: Any) {
        let error = validateForm()
        if error == "" {
            API.postRequest(target: .login(username: usernameTF.text!, password: passwordTF.text!), useHud: true, statusHud: "Loging in..",  success: { (response) in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let containerViewController = storyboard.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
                containerViewController.controllerId = "AboutNavigation"
                if self.navigationController?.viewControllers[0] == self{
                    self.navigationController!.viewControllers.append(containerViewController)
                }else{
                    self.present(containerViewController, animated: true, completion: nil)
                }
            }, error: { (error) in
                print(error)
            })
        }else {
            showAlert(self, title: "", message: error, okFunction: nil, cancelFunction: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
