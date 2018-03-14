//
//  ContainerViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/11/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class ContainerViewController: MFSideMenuContainerViewController {

    var controllerId: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        let sideBarStoryboard = UIStoryboard(name: "ViewsInSideBar", bundle: nil)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbarController = sideBarStoryboard.instantiateViewController(withIdentifier: controllerId) as! TabbarNavigationViewController
        let leftSideMenuController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenuController") as! SideMenuController
        leftSideMenuController.containerViewController = self
        leftMenuViewController = leftSideMenuController
        centerViewController = tabbarController
        menuContainerViewController.panMode = MFSideMenuPanModeSideMenu
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shadow.radius = 1.0
        shadow.color = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
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
