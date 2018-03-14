//
//  BaseNavigationViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/11/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = Configuration.COLOR_THEME
        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white as Any]
        self.navigationBar.tintColor = UIColor.lightGray
        self.hidesNavigationBarHairline = true
        // Do any additional setup after loading the view.
    }

    /**
     Make BaseNavigationController with a rootViewController that will be presented from sidebarStoryboard.
     - Parameter controllerId: controller id in storyboard.
     - Parameter messageObject: anyobject that send to the destinated view controller.
     - Returns: BaseNavigationController that will be presented.
     */
    class func gotoViewInSideBar(_ controllerId: String, messageObject: Any!) -> BaseNavigationViewController {
        let storyboard = UIStoryboard(name: "ViewsInSideBar", bundle: nil)
        let sidebarController = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigation") as! BaseNavigationViewController
        let controller = storyboard.instantiateViewController(withIdentifier: controllerId)
        if controller is BaseViewController {
            let newController = controller as! BaseViewController
            newController.messageObject = messageObject
        }
        sidebarController.setViewControllers([controller], animated: false)
        return sidebarController
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
