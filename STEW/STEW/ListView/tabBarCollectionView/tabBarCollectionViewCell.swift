//
//  tabBarCollectionViewCell.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class tabBarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var unitNameLabel: UILabel!
    @IBOutlet weak var UnderLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func selected(){
        unitNameLabel.textColor = .mainLightPurple
        UnderLineView.isHidden = false
    }
    func notSelected(){
        unitNameLabel.textColor = .lightGray
        UnderLineView.isHidden = true
    }

}
