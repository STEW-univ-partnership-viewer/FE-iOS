//
//  SettingViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/23/24.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var darkmodeSwitch: UISwitch!
    @IBOutlet weak var nofiticationSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        uiSet()
    }
    private func uiSet(){
        darkmodeSwitch.isOn = UserDefaults.standard.bool(forKey: "darkModeState")
    }
    @IBAction func darkModeSwitchTapped(_ sender: UISwitch) { UserDefaults.standard.set(darkmodeSwitch.isOn, forKey: "darkModeState")
    }
    
}
