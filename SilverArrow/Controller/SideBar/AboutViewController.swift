//
//  AboutViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/11/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit
import SideMenu

class AboutViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var aboutDescriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = false
        title = "About Us"
        tabBarController?.tabBar.isHidden = true
//        setNavigationTransparent()
//        navigationItem.hidesBackButton = true
//        let storyBoard = UIStoryboard(name: "ViewsInSideBar", bundle: nil)
//        SideMenuManager.menuLeftNavigationController = storyBoard.instantiateViewController(withIdentifier: "SideMenu") as? UISideMenuNavigationController
//        SideMenuManager.menuAddPanGestureToPresent(toView: (self.navigationController?.navigationBar)!)
//        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: (self.navigationController?.view)!)
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickSideMenu(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
