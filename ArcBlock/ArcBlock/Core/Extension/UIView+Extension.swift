//
//  .swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

extension UIView {
    var topViewController: UIViewController? {
        for view in sequence(first: self.superview, next: {$0?.superview}){
            if let responder = view?.next{
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
}
extension UIView {
    var left: CGFloat{
        return self.frame.origin.x
    }
    var right: CGFloat{
        return self.frame.origin.x + self.frame.size.width
    }
    var centerX:CGFloat {
        return self.center.x
    }
    var height: CGFloat{
        return self.frame.size.height
    }
    var width: CGFloat{
        return self.frame.size.width
    }
    var bottom:CGFloat{
        return self.frame.origin.y + height
    }
    
    var centerY: CGFloat{
        return self.center.y
    }
   
}
