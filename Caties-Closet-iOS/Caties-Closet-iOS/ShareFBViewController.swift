//
//  ShareFBViewController.swift
//  Caties-Closet-iOS
//
//  Created by Hack4ImpactBostonUniversity on 6/26/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKShareKit


class ShareFBViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var myImageView: UIImageView!
    var showImagePicketButton: UIButton!
    
    
    @IBOutlet weak var shareImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let content = FBSDKShareLinkContent()
        content.contentURL = URL(string: "https://www.catiescloset.org/")
        let shareButton = FBSDKShareButton()
        shareButton.shareContent = content
        shareButton.center = view.center
        view.addSubview(shareButton)
    }
    
    
    private func shareInFacebook() {
        let photo = FBSDKSharePhoto(image: shareImage!, userGenerated: true)
        let content = FBSDKSharePhotoContent()
        content.photos = [photo]
        let showDialog = FBSDKShareDialog()
        
        if (showDialog.canShow) {
            showDialog.show()
        } else {
        }
        
        
        
        
        _ = FBSDKSharePhoto(image: shareImage, userGenerated: true)
        _ = FBSDKSharePhotoContent()
        content.photos = [photo]
        
        let dialog = FBSDKShareDialog()
        dialog.fromViewController = self
        dialog.shareContent = content
        dialog.mode = FBSDKShareDialogMode.automatic
        dialog.show()
        
        let shareButton = FBSDKShareButton()
        shareButton.shareContent = content
        shareButton.center = view.center
        view.addSubview(shareButton)
    }
    
    
}
