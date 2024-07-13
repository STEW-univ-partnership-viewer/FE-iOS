//
//  CompanyDetailViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/13/24.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyAddressLabel: UILabel!
    @IBOutlet weak var companyCategoryView: UIView!
    @IBOutlet weak var companyCategoryLabel: UILabel!
    @IBOutlet weak var companyBenefitLabel: UILabel!
    @IBOutlet weak var companyBenefitDateLabel: UILabel!
    var locationData: Location?
    var benefitData: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        configure()
    }
    
    func configure(){
        companyImageView.image = locationData?.image
        companyAddressLabel.text = locationData?.address
        companyCategoryLabel.text = locationData?.category.rawValue
        companyNameLabel.text = locationData?.name
        companyBenefitLabel.text = benefitData
    }
    
    private func uiSet(){
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.frame
        view.insertSubview(visualEffectView, belowSubview: frameView)
        frameView.layer.cornerRadius = 20
        companyImageView.layer.cornerRadius = 16
        companyCategoryView.layer.cornerRadius = 5
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
