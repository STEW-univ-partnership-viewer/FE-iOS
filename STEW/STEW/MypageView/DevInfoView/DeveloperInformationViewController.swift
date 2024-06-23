//
//  DeveloperInformationViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/23/24.
//

import UIKit

class DeveloperInformationViewController: UIViewController {
    @IBOutlet weak var developerInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        // Do any additional setup after loading the view.
    }
    
    private func uiSet(){
        developerInformationLabel.text = "20231497 황채웅\n2023???? 박서은\n20231498 최원석"
    }

}
