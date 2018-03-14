//
//  SignUpViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/10/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class SignUpViewController: BaseViewController, TTTAttributedLabelDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var companyTF: UITextField!
    @IBOutlet weak var companyAddressTF: UITextField!
    @IBOutlet weak var companyEmailTF: UITextField!
    @IBOutlet weak var companyPhoneTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var termsLabel: TTTAttributedLabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    var checkBoxClick = false
    override func viewDidLoad() {
        super.viewDidLoad()

        checkBoxView.layer.borderColor = UIColor.gray.cgColor
        checkBoxView.layer.borderWidth = 0.3
        checkBoxView.layer.masksToBounds = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickCheckBox))
        checkBoxView.addGestureRecognizer(tapGesture)
        customButton(button: signupButton)
        signupButton.addTarget(self, action: #selector(onClickSignUp), for: .touchUpInside)
        checkMarkImage.isHidden = true
        checkMarkImage.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAgreementLabel()
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
    
    @objc func onClickSignUp() {
        let error = validateForm()
        if error == "" {
            self.dismiss(animated: true, completion: nil)
        }else {
            showAlert(self, title: "", message: error, okFunction: {
                
            }, cancelFunction: nil)
        }
    }
    
    private func validateForm() -> String {
        var errorMessage = ""
        if (emailTF.text?.count)! < 3 {
            errorMessage = "Email minimal input is 3 character"
        }else if Configuration.checkWithRegex(text: emailTF.text, regex: Configuration.REGEX_EMAIL) {
            errorMessage = "Email format is incorect"
        }else if (passwordTF.text?.count)! < 3 {
            errorMessage = "Password minimal input is 3 character"
        }else if (confirmPasswordTF.text?.count)! < 3 {
            errorMessage = "Confirm Password minimal input is 3 character"
        }else if confirmPasswordTF.text != passwordTF.text {
            errorMessage = "These passwords don't match"
        }else if (firstNameTF.text?.count)! < 3 {
            errorMessage = "First Name minimal input is 3 character"
        }else if (lastNameTF.text?.count)! < 3 {
            errorMessage = "Last Name minimal input is 3 character"
        }else if (companyTF.text?.count)! < 3 {
            errorMessage = "Company minimal input is 3 character"
        }else if (companyAddressTF.text?.count)! < 3 {
            errorMessage = "Company Address minimal input is 3 character"
        }else if (companyEmailTF.text?.count)! < 3 {
            errorMessage = "Company Email minimal input is 3 character"
        }else if (companyPhoneTF.text?.count)! < 3 {
            errorMessage = "Company Phone minimal input is 3 character"
        }else if (phoneNumberTF.text?.count)! < 3 {
            errorMessage = "Phone Number minimal input is 3 character"
        }else if Configuration.checkWithRegex(text: phoneNumberTF.text, regex: Configuration.REGEX_PHONE_NUMBER) {
            errorMessage = "Phone Number format is incorect"
        }else if !checkBoxClick {
            errorMessage = "You have'nt checked agree Terms of use and Privacy Policy"
        }
        return errorMessage
    }

    func configureAgreementLabel() {
        let termString = "Terms of use "
        let policyString = "Privacy Policy"
        let normalAttribs = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:UIColor.black]
        let linkAttribs = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:UIColor.red]
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "agree to the ", attributes: normalAttribs))
        attributedString.append(NSAttributedString(string: termString))
        attributedString.append(NSAttributedString(string: "and ", attributes: normalAttribs))
        attributedString.append(NSAttributedString(string: policyString))
        attributedString.append(NSAttributedString(string: " ", attributes: normalAttribs))
        let rangeTerm = NSString(string: attributedString.string).range(of: termString)
        let rangePrivacyPolicy = NSString(string: attributedString.string).range(of: policyString)
        termsLabel.attributedText = attributedString
        termsLabel.linkAttributes = linkAttribs
        termsLabel.delegate = self
        termsLabel.isUserInteractionEnabled = true
        termsLabel.addLink(to: URL(string: "action://tapTermPrivacy"), with: rangeTerm)
        termsLabel.addLink(to: URL(string: "action://tapTermPrivacy"), with: rangePrivacyPolicy)
    }
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        if (url.scheme?.hasPrefix("action"))! {
            if url.host!.hasPrefix("tapTermPrivacy") {
                self.showAlert(self, title: "", message: "Coming Soon!", okFunction: nil, cancelFunction: nil)
            }
        } else {
            /* deal with http links here */
        }
    }
    
    func tapTermPrivacy(){
        print("func is call")
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
