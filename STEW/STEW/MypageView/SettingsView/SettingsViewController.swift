//
//  SettingsViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/24/24.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var nightModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nightModeSwitch.isOn = UserDefaults.standard.bool(forKey: "isNightModeEnabled")
            
    }
    @IBAction func nightModeSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.setValue(nightModeSwitch.isOn, forKey: "isNightModeEnabled")
    }
    
}
