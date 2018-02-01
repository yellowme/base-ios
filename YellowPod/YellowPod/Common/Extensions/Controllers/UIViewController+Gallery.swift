//
//  UIViewController+Gallery.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/15/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

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
            // TODO: Fix iPad issues
            //controller.modalPresentationStyle = .popover
            //let popover = controller.popoverPresentationController
            //popover.delegate = controller
            //popover.permittedArrowDirections = .up
            //popover.sourceView = controller.view
            //popover.sourceRect = controller.view.bounds
        } else {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}
