//
//  ForgotPasswordViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/11/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        customButton(button: submitButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        var errorMessage = ""
        if (emailTF.text?.count)! < 3 {
            errorMessage = "Email minimal input is 3 character"
        }else if Configuration.checkWithRegex(text: emailTF.text, regex: Configuration.REGEX_EMAIL) {
            errorMessage = "Email format is incorect"
        }
        if errorMessage == "" {
            //submit method
        }else {
            showAlert(self, title: "", message: errorMessage, okFunction: {
                
            }, cancelFunction: nil)
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
