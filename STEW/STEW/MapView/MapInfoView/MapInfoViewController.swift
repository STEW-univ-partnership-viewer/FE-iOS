//
//  MapInfoViewController.swift
//  STEW
//
//  Created by 황채웅 on 8/6/24.
//

import UIKit

class MapInfoViewController: UIViewController {
    @IBOutlet private weak var companyImageView: UIImageView!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var companyAddressLabel: UILabel!
    @IBOutlet private weak var companyCategoryLabel: UILabel!
    @IBOutlet private weak var companyCategoryView: UIView!
    @IBOutlet private weak var addFavoriteButton: UIButton!
    
    private var isFavorite: Bool = false
    private var buttonTappedColor: UIColor = UIColor(red: 0.256, green: 0.105, blue: 0.503, alpha: 1)
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        configure(location: location ?? goCine)
    }
    
    private func uiSet(){
        companyImageView.layer.cornerRadius = 12
        companyCategoryView.layer.cornerRadius = 5
        addFavoriteButton.layer.cornerRadius = 7
        addFavoriteButton.backgroundColor = isFavorite ?
        buttonTappedColor : .mainPurple
        addFavoriteButton.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
        addFavoriteButton.setTitle("즐겨찾기 완료", for: .selected)
        addFavoriteButton.setTitle("즐겨찾기 등록", for: .normal)
    }
    
    private func configure(location: Location){
        companyImageView.image = location.image
        companyNameLabel.text = location.name
        companyAddressLabel.text = location.address
        companyCategoryLabel.text = location.category.rawValue
    }
    
    @IBAction func addFavoriteButtonTapped(_ sender: UIButton) {
        addFavoriteButton.backgroundColor = !isFavorite ?
        buttonTappedColor : .mainPurple
        isFavorite = !isFavorite
        addFavoriteButton.isSelected = !addFavoriteButton.isSelected
        //TODO: 즐겨찾기에 등록
    }
    
}
