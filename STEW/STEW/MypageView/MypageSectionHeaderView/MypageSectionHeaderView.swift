//
//  MypageSectionHeaderView.swift
//  STEW
//
//  Created by 황채웅 on 7/21/24.
//

import UIKit

class MypageSectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var mypageSectionLabel: UILabel!
    var mypageSectionLabelText: String? {
        didSet {
            mypageSectionLabel.text = mypageSectionLabelText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mypageSectionLabel.text = mypageSectionLabelText
    }
}
