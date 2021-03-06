//
//  AvailableGroupsCell.swift
//  VK Client
//
//  Created by Rayen D on 06.09.2020.
//  Copyright © 2020 Rayen D. All rights reserved.
//

import UIKit

class AvailableGroupsCell: UITableViewCell {
    
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var animateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        groupImage.layer.cornerRadius = groupImage.frame.size.height / 2
        animateButton.layer.cornerRadius = groupImage.frame.size.height / 2
        groupImage.contentMode = .scaleAspectFill
    }
    
    @IBAction func animatedImage(_ sender: UIButton) {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        
        animation.fromValue = 0.8
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 5
        animation.duration = 5
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.groupImage.layer.add(animation, forKey: nil)
    }
    
    func configure(for model: Group) {
        groupNameLabel.text = model.nameGroup
        groupImage.image = UIImage(named: model.imageGroup)
    }
}
