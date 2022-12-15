//
//  LitWebViewController.swift
//  Pods-LitSwift
//
//  Created by leven on 2022/12/7.
//

import Foundation
import UIKit
import WebKit

public class LitWebViewController: UIViewController, WKNavigationDelegate {
    
    private let url = "https://jlabsau.github.io/oauth-pkp-signup-example/"
    private let titleKeyPath = "title"
    private let estimatedProgressKeyPath = "estimatedProgress"

    lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.preferences = WKPreferences()
        config.preferences.minimumFontSize = 10
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.processPool = WKProcessPool()
        config.userContentController = WKUserContentController()
        let webView = WKWebView(frame: CGRect.zero, configuration: config)
        webView.addObserver(self, forKeyPath: titleKeyPath, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: estimatedProgressKeyPath, options: .new, context: nil)
        webView.allowsBackForwardNavigationGestures = true
        if #available(iOS 9.0, *) {
            webView.allowsLinkPreview = true
        }
        webView.navigationDelegate = self
        webView.backgroundColor = UIColor.white
        return webView
    }()
        
//    let url: String
//
//    init(url: String) {
//        self.url = url
//        super.init(nibName: nil, bundle: nil)
//    }
    
    private var handlers: [String: ((Any) -> Void)] = [:]
    deinit {
        webView.removeObserver(self, forKeyPath: titleKeyPath)
        webView.removeObserver(self, forKeyPath: estimatedProgressKeyPath)
    }
    
    public func addJavaScriptHandler(handlerName: String, callBack: @escaping ((Any) -> Void)) {
        handlers[handlerName] = callBack
    }
    
    
    public func evaluateJavaScript(_ jsString: String, callback: ((Any?, Error?) -> Void)? = nil) {
        self.webView.evaluateJavaScript(jsString, completionHandler: callback)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.webView.frame = self.view.bounds
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.webView)
        UIPasteboard.general.string = url
        if let webUrl = URL(string: url) {
            self.webView.load(URLRequest(url: webUrl))
        }
    }

    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == titleKeyPath {
            self.title = change?[.newKey] as? String
        }
    }
    
    func gotBack() {
        if (self.navigationController?.viewControllers.count ?? 0) > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
