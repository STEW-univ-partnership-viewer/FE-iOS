//
//  MypageSectionFooterView.swift
//  STEW
//
//  Created by 황채웅 on 7/21/24.
//

import UIKit

class MypageSectionFooterView: UICollectionReusableView {
    @IBOutlet weak var versionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        superview?.backgroundColor = .white
    }
    
}
