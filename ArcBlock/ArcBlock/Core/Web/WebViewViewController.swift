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
    var progressView: UIProgressView!
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
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            if webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
        if keyPath == "title" {
            navigationItem.title = self.webView.title
        }
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
        
        //进度条初始化
        let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 2))
        progressView.backgroundColor = UIColor.blue;
        progressView.tintColor = UIColor.blue
        //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 1.5);
        view.addSubview(progressView)
        self.progressView = progressView
        progressView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(0)
            make.height.equalTo(2)
        }
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
}


extension WebViewViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.progressView.isHidden = false
        self.progressView.transform = CGAffineTransform(scaleX: 1, y: 1.5)
        self.view.bringSubviewToFront(self.progressView)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.progressView.isHidden = true
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.progressView.isHidden = true
    }
}
