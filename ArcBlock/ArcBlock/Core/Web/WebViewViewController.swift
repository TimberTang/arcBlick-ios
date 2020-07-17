//
//  WebViewViewController.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit
import WebKit
import SnapKit

class WebViewViewController: UIViewController {

    var webView: WKWebView!
    var url: String?
    var webTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        title = webTitle
        if let urlString = url, let URL = URL(string: urlString) {
            loadReqeust(with: URL)
        }
    }
    
    
    convenience init(_ url: String?, webTitle: String? = "") {
        self.init(nibName: nil, bundle: nil)
        self.url = url
        self.webTitle = webTitle
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadReqeust(with url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}


fileprivate extension WebViewViewController {
    func setupWebView () {
        view.backgroundColor = .white
        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.uiDelegate = self
//        webView.scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
}


extension WebViewViewController: WKNavigationDelegate, WKUIDelegate {
    
}
