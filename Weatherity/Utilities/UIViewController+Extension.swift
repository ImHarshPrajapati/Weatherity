//
//  UIViewController+Extension.swift
//
//
//  Created by Harsh Prajapati on 22/11/18.
//  Copyright © 2018 Farmd Apps. All rights reserved.
//

import UIKit
import Foundation
import MapKit


extension UIViewController {
        
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    //MARK: - Alert Control
    func setImgeOnTextfield(_ image: UIImage, _ size: Int = 40) -> UIView {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        img.contentMode = .center
        img.image = image
        return img
    }
    
    func openURLInSafari(_ strUrl: String) {
        
        guard let url = URL(string: strUrl) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            //If you want handle the completion block than
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            print("URL can not be opened")
        }
    }
    
    
    func navigate(_ navVC: AnyClass, pushVC: UIViewController) {
        if let navController = self.navigationController {
            for obj in navController.viewControllers {
                if obj.isMember(of: navVC) {
                    navController.popToViewController(obj, animated: true)
                    return
                }
            }
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func popupAlert(_ title: String?, _ message: String?, _ actionTitles: [String?], _ actions:[((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            alert.addAction(UIAlertAction(title: title, style: .default, handler: actions[index]))
        }
        self.present(alert, animated: true, completion: nil)
    }
}
