//
//  Extension+UIApplication.swift
//  SubCWPopup
//
//  Created by cw-james on 2022/01/19.
//

import UIKit

public extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        /// PopupViewController 중복 호출을 막기위한 설정
//        if let _ = base as? PopupViewController { return nil }
        
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
