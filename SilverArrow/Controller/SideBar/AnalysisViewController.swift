//
//  AnalysisViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/13/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class AnalysisViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, TTTAttributedLabelDelegate {

    @IBOutlet weak var analysTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Analysis"
        analysTableView.estimatedRowHeight = 70
        analysTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Configuration.TITLE.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnalysCell", for: indexPath) as! AnalysTableViewCell
        cell.titleLabel.text = Configuration.TITLE[indexPath.row]
        cell.postDateLabel.text = Configuration.POSTING_DATE[indexPath.row]
        
        let readMoreString = " Read More"
        let normalAttribs = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:UIColor.black]
        let linkAttribs = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:UIColor(red: 7/255.0, green: 76/255.0, blue: 133/255.0, alpha: 1.0)]
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: Configuration.CONTENT[indexPath.row], attributes: normalAttribs))
        attributedString.append(NSAttributedString(string: readMoreString))
        let range = NSString(string: attributedString.string).range(of: readMoreString)
        cell.contentLabel.attributedText = attributedString
        cell.contentLabel.linkAttributes = linkAttribs
        cell.contentLabel.delegate = self
        cell.contentLabel.isUserInteractionEnabled = true
        cell.contentLabel.addLink(to: URL(string: "action://tapTermPrivacy"), with: range)
        cell.selectionStyle = .none
        return cell
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
