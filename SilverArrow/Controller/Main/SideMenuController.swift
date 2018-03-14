//
//  SideMenuController.swift
//  SilverArrow
//
//  Created by Apit on 2/11/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class SideMenuController: UITableViewController {

    @IBOutlet weak var aboutUsLabel: UILabel!
    @IBOutlet weak var irEngineLabel: UILabel!
    @IBOutlet weak var irMonitoringLabel: UILabel!
    @IBOutlet weak var analysisLabel: UILabel!
    @IBOutlet weak var targetingInvestorLabel: UILabel!
    @IBOutlet weak var contactUsLabel: UILabel!
    @IBOutlet weak var logoutLabel: UILabel!
    
    var isExpand = false
    var containerViewController: ContainerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            presentView("AboutNavigation", messageObject: nil)
        }else if indexPath.row == 2 {
            if isExpand {
                isExpand = false
            }else {
                isExpand = true
            }
        }else if indexPath.row == 3 {
            UserDefaults.standard.set("IR Monitoring", forKey: "titleWeb")
            presentView("IRMonitoringNavigation", messageObject: nil)
        }else if indexPath.row == 4 {
            UserDefaults.standard.set("Targeting Investor", forKey: "titleWeb")
            presentView("IRMonitoringNavigation", messageObject: nil)
        }else if indexPath.row == 5 {
            presentView("AnalysisNavigation", messageObject: nil)
        }else if indexPath.row == 6 {
            presentView("ContactUsNavigation", messageObject: nil)
        }else if indexPath.row == 7 {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(loginController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 114
        }else if indexPath.row == 2 {
            if isExpand {
                return 50
            }else {
                return 50
            }
        }else if indexPath.row == 3 {
            if isExpand {
                return 50
            }else {
                return 0
            }
        }else if indexPath.row == 4 {
            if isExpand {
                return 50
            }else {
                return 0
            }
        }
        return 50
    }
    /**
     method for presentViewController
     
     - parameter controllerId:  controller id in storyboard
     - parameter messageObject: object that will be send to destinated View controller
     */
    func presentView(_ controllerId: String, messageObject: Any!) {
        menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let containerViewController = storyboard.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
        containerViewController.controllerId = controllerId
        present(containerViewController, animated: false, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
