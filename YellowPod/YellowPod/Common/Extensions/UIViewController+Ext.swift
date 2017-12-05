//
//  UIViewController+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/12/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import UIKit

struct LoadingConstants {
    static let progressIndicatorOverlayTag = 20002
    static let progressIndicatorTag = 10001
}

//MARK: - Keyboard
extension UIViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addDismissGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
}

//MARK: - Alerts {
extension UIViewController {
    func displayError(with message: String){
        /*AlertHelper.showSingleAlertView(
            self, Constants.whoops, message, Constants.understood
        )*/
    }
}

//MARK: - Camera and Gallery Picker
public protocol ImageSelectorProtocol: UIImagePickerControllerDelegate, UINavigationControllerDelegate { }

extension ImageSelectorProtocol {
    
    func showImagePickerFromCameraAndGallery(on controller: UIViewController) {
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.view.tintColor = UIColor.primary
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            picker.sourceType = .camera
            controller.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in
            picker.sourceType = .photoLibrary
            controller.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            debugPrint("From ipad")
            //            controller.modalPresentationStyle = .popover
            //            let popover = controller.popoverPresentationController
            //            //popover.delegate = controller
            //            popover.permittedArrowDirections = .up
            //            popover.sourceView = controller.view
            //            popover.sourceRect = controller.view.bounds
        } else {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - Activity Indicator
extension UIViewController {
    func setProgress(to isLoading: Bool, with alpha: CGFloat, overlay: UIColor) {
        if isLoading {
            self.showActivityIndicator(view: self.view, withOpaqueOverlay: true, withAlpha: alpha, withOverlayColor: overlay)
        } else {
            self.hideActivityIndicator(view: self.view)
        }
    }
    
    func setProgress(to isLoading: Bool) {
        if isLoading {
            self.showActivityIndicator(view: self.view, withOpaqueOverlay: true)
        } else {
            self.hideActivityIndicator(view: self.view)
        }
    }
    
    private func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool, withAlpha: CGFloat = 0.3, withOverlayColor: UIColor = UIColor.lightGray) {
        
        // this will be the alignment view for the activity indicator
        var superView: UIView = view
        
        // if we want an opaque overlay, do that work first then put the activity indicator within that view; else just use the passed UIView to center it
        if withOpaqueOverlay {
            let overlay = UIView()
            overlay.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
            overlay.layer.backgroundColor = withOverlayColor.cgColor
            overlay.alpha = withAlpha
            overlay.tag = LoadingConstants.progressIndicatorOverlayTag
            
            overlay.center = superView.center
            overlay.isHidden = false
            superView.addSubview(overlay)
            superView.bringSubview(toFront: overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
        }
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        indicator.center = superView.center
        indicator.tag = LoadingConstants.progressIndicatorTag
        indicator.color = UIColor.primary
        indicator.isHidden = false
        
        superView.addSubview(indicator)
        superView.bringSubview(toFront: indicator)
        
        indicator.startAnimating()
        
        // also indicate network activity in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private func hideActivityIndicator(view: UIView) {
        
        // stop the network activity animation in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // remove the activity indicator and optional overlay views
        view.viewWithTag(LoadingConstants.progressIndicatorTag)?.removeFromSuperview()
        view.viewWithTag(LoadingConstants.progressIndicatorOverlayTag)?.removeFromSuperview()
    }
}
