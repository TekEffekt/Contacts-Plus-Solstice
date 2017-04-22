//
//  LoadingIndicator.swift
//  Ready Badger
//
//  Created by Kyle Zawacki on 12/18/16.
//  
//

import Foundation
import MBProgressHUD

class LoadingIndicator {
    
    static var indicator: MBProgressHUD?
    
    static func show() {
        OperationQueue.main.addOperation {
            guard let base = UIApplication.shared.keyWindow?.rootViewController else { return }
            indicator?.hide(animated: true)
            indicator = MBProgressHUD.showAdded(to: base.view, animated: true)
            indicator?.label.text = "Loading.."
            indicator?.isUserInteractionEnabled = false
        }
    }
    
    static func hide() {
        OperationQueue.main.addOperation {
            indicator?.hide(animated: true)
        }
    }
    
}
