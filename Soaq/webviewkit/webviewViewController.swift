//
//  webviewViewController.swift
//  Soaq
//
//  Created by tr on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WebKit

class webviewViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://termsfeed.com/blog/sample-terms-and-conditions-template/")
        webview.load(URLRequest(url: url!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
