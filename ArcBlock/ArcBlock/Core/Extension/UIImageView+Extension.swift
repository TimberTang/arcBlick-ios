//
//  .swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//


import UIKit
import KingfisherWebP

extension UIImageView {
    typealias DownloadProgressBlock = ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)
    typealias CompletionHandler = ((_ image: UIImage?, _ error: NSError?) -> Void)
    
    /// Set avatar-style image with a default placeholder named "avatar_placeholder".
    /// - Parameters:
    ///     - urlString: URL of the avatar image, in String.
    ///     - placeholder: You can customize your placeholder.
    /// If the image fails to load, the image view show the placeholder.
    @objc func setAvatar(with urlString: String?,
                         placeholder: UIImage? = .placeHolder) {
        setImage(with: urlString, placeholder: placeholder)
    }
    
    /// Set image with a default placeholder named "image_placeholder_opaque".
    /// - Parameters:
    ///     - urlString: URL of the image, in String.
    ///     - placeholder: You can customize your placeholder.
    /// If the image fails to load, the image view show the placeholder.
    @objc func setImage(with urlString: String?,
                        placeholder: UIImage? = .placeHolder) {
        if let urlString = urlString {
            kf.setImage(with: URL(string: urlString), placeholder: placeholder)
        } else {
            image = placeholder
        }
    }
    
    /// Set image with a default placeholder named "image_placeholder_opaque".
    /// - Parameters:
    ///   - urlString: URL of the image, in String.
    ///   - placeholder: You can customize your placeholder.
    ///   - progressBlock: progress
    ///   - completionHandler: completionHandler
    /// If the image fails to load, the image view show the placeholder.
    @objc func setImage(with urlString: String?,
                        placeholder: UIImage? = .placeHolder,
                        progressBlock: DownloadProgressBlock? = nil,
                        completionHandler: CompletionHandler? = nil) {
        if let urlString = urlString, urlString.isEmpty == false {
            kf.setImage(with: URL(string: urlString), placeholder: placeholder, options: nil, progressBlock: { (receivedSize, totalSize) in
                progressBlock?(receivedSize, totalSize)
            }) { (image, error, cacheType, url) in
                completionHandler?(image, error)
            }
        } else {
            image = placeholder
        }
    }
}

extension UIImage {
    static let placeHolder = UIImage(named: "image001")
}
