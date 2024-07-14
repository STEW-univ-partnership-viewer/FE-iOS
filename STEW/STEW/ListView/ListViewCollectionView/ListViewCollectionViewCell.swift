//
//  ListViewCollectionViewCell.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class ListViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyCategoryView: UIView!
    @IBOutlet weak var companyCategoryLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiSet()
    }

    private func uiSet(){
        companyCategoryView.layer.cornerRadius = 5
    }
    func configure(with location: Location){
        companyImageView.image = location.image
        companyAddressLabel.text = location.address
        companyCategoryLabel.text = location.category.rawValue
        companyNameLabel.text = location.name
    }
}
