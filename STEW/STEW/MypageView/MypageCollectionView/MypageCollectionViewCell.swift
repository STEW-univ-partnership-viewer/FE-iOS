//
//  MypageCollectionViewCell.swift
//  STEW
//
//  Created by 황채웅 on 7/21/24.
//

import UIKit

class MypageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mypageLabel: UILabel!
    var mypageLabelText: String? {
        didSet {
            mypageLabel.text = mypageLabelText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mypageLabel.text = mypageLabelText
    }
}
