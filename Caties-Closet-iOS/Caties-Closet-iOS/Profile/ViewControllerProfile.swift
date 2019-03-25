//
//  ViewControllerProfile.swift
//  Caties-Closet-iOS
//
//  Created by Michael Hendrick on 2/25/19.
//  Copyright © 2019 Hack4ImpactBostonUniversity. All rights reserved.
//

import UIKit

class ViewControllerProfile: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBAction func editProfile(_ sender: Any) {
        // perform segue to edit profile
    }
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var numDonations: UILabel!
    @IBOutlet weak var numBadges: UILabel!
    @IBOutlet weak var roundButton: UIButton!
    
    
    var imageLabelArr = ["In-School Resource", "Sensitive & Discrete", "Clothing They Are Proud Of", "Serving Kids of All Ages", "Clothing and Beyond"]
    
    var imageArray = [#imageLiteral(resourceName: "Door"), #imageLiteral(resourceName: "Discrete"), #imageLiteral(resourceName: "Cheer"), #imageLiteral(resourceName: "allAges"), #imageLiteral(resourceName: "toiletries")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRounded()
        
        
        fullName.text = "Juan Zapata"
        locationLabel.text = "Boston, MA"
        locationLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
        locationLabel.textColor = UIColor.lightGray
        
        
        numDonations.text = "5"
        numBadges.text = "1"
        
        
        roundButton.layer.cornerRadius = 4
    }
    
    func makeRounded() {
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.clear.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewControllerProfile: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCollectionViewCell
        cell?.img.image = imageArray[indexPath.row]
        cell?.imgLabel.text = imageLabelArr[indexPath.row]
        cell?.imgLabel.lineBreakMode = .byWordWrapping
        cell?.imgLabel.numberOfLines = 2
        return cell!
    }
    
    
    
}
