//
//  WebViewVC.swift
//  RestarentProject
//
//  Created by Jayalakshmi NP on 28/07/20.
//  Copyright © 2020 natarajan k. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController,WKNavigationDelegate {
    
    //https://www.bottlerocketstudios.com
    
    @IBOutlet weak var bottlerRocketWebView: WKWebView!
    var backButton:UIBarButtonItem?
    var forwardButton:UIBarButtonItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       if let url = URL(string: "https://www.bottlerocketstudios.com")
       {
        let request = URLRequest(url: url)
        bottlerRocketWebView.load(request)
        }
        
        
        self.bottlerRocketWebView.navigationDelegate = self
        barButton()
//        self.backButton?.isEnabled = self.bottlerRocketWebView.canGoBack
//        self.forwardButton?.isEnabled = self.bottlerRocketWebView.canGoForward
//        self.bottlerRocketWebView.addObserver(self, forKeyPath:#keyPath(WKWebView.canGoBack), options: .new, context: nil)
//        self.bottlerRocketWebView.addObserver(self, forKeyPath:#keyPath(WKWebView.canGoForward), options: .new, context: nil)
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
//        if let _ = object as? WKWebView{
//            if keyPath == #keyPath(WKWebView.canGoBack){
//                self.backButton?.isEnabled = self.bottlerRocketWebView.canGoBack
//
//            }else if keyPath == #keyPath(WKWebView.canGoForward){
//                self.forwardButton?.isEnabled = self.bottlerRocketWebView.canGoForward
//            }
//        }
//    }

    func barButton(){
        
        
        self.navigationController?.setToolbarHidden(false, animated: true)
        let backButton = UIBarButtonItem(image:UIImage.init(named: "leftarrow"),
                                         style: .plain,
                                         target: self.bottlerRocketWebView,
                                         action: #selector(WKWebView.goBack))
        let forwardButton = UIBarButtonItem(image:UIImage.init(named: "rightarrow"),
                                         style: .plain,
                                         target: self.bottlerRocketWebView,
                                         action: #selector(WKWebView.goForward))
        let reloadButton = UIBarButtonItem(image:UIImage.init(named: "refresh"),
                                            style: .plain,
                                            target: self.bottlerRocketWebView,
                                            action: #selector(WKWebView.reload))
        self.toolbarItems = [backButton,reloadButton,forwardButton]
        self.backButton = backButton
        self.forwardButton = forwardButton
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.bottlerRocketWebView.evaluateJavaScript("document.title") { (result, error) in
            self.navigationItem.title = result as? String
        }
    }

   
}
