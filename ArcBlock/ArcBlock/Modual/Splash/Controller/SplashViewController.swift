//
//  SplashViewController.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//


import UIKit
import Lottie

class SplashViewController: UIViewController {

    public typealias CompletionBlock = (Bool) -> Void
    var completionBlock: CompletionBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = AnimationView(name: "splash")
        animationView.frame = self.view.frame
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        animationView.play { (b) in
            self.completionBlock?(b)
        }
    }

}
