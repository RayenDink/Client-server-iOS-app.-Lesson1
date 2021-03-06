//
//  DetailFriendController.swift
//  VK Client
//
//  Created by Rayen D on 06.09.2020.
//  Copyright © 2020 Rayen D. All rights reserved.
//

import UIKit

class DetailFriendController: UICollectionViewController {
    
    var friendsImage = [User]()
    var titleItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: Help Function
    
    private func setupNavigationBar() {
        
        if let topItem = navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        guard titleItem != nil else { return }
        title = titleItem
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "seeImages" else { return }
        
        let pageViewController = segue.destination as? PageViewController
        
        pageViewController?.titleItem = titleItem
        pageViewController?.imagesUser = friendsImage
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailFriendCell", for: indexPath) as! DetailFriendCell
        let friendImage = friendsImage[indexPath.row]
        
        cell.configure(for: friendImage)
        
        return cell
    }
}
