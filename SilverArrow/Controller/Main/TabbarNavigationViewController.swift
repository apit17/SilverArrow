//
//  TabbarNavigationViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/11/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class TabbarNavigationViewController: BaseNavigationViewController {

    var leftButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSideMenu()
        // Do any additional setup after loading the view.
    }
    
    func setupSideMenu() {
        let sideMenuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        sideMenuButton.addTarget(self, action: #selector(leftSideMenuButtonPressed(_:)), for: .touchUpInside)
        sideMenuButton.setBackgroundImage(UIImage(named: "menu"), for: UIControlState.normal)
        sideMenuButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        sideMenuButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leftButtonItem = UIBarButtonItem(customView: sideMenuButton)
        navigationItem.leftBarButtonItem = leftButtonItem
        navigationBar.items = [navigationItem]
    }

    @objc func leftSideMenuButtonPressed(_ sender: Any) {
        let leftSideMenuController = menuContainerViewController.leftMenuViewController as! SideMenuController
        leftSideMenuController.viewWillAppear(true)
        menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        menuContainerViewController.shadow.enabled = true
        menuContainerViewController.shadow.radius = 10.0
        menuContainerViewController.shadow.color = UIColor.black
        menuContainerViewController.shadow.opacity = 0.75
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
