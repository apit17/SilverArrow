//
//  DummyWebViewController.swift
//  SilverArrow
//
//  Created by Apit on 2/13/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit

class DummyWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let titleController = UserDefaults.standard.string(forKey: "titleWeb") {
            title = titleController
            UserDefaults.standard.removeObject(forKey: "titleWeb")
        }
        var urlString = ""
        if title == "IR Monitoring" || title == "IR Monitoring" {
            urlString = "http://www.silverarrow.id/product/view/14"
        }else {
            urlString = "http://www.silverarrow.id/article/lists/library"
        }
        let url = NSURL(string: urlString);
        webView.delegate = self
        let request = URLRequest(url: url! as URL, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 60)
        webView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        webView.scalesPageToFit = true
        webView.loadRequest(request )
        ProgressHUD.show("Loading Page")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        ProgressHUD.show("Loading Page")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        ProgressHUD.dismiss()
        
//        let urlResponse = URLCache.shared.cachedResponse(for: webView.request!)
//        let httpResponse = urlResponse?.response as! HTTPURLResponse
//        let statusCode = httpResponse.statusCode
//        print(statusCode)
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
