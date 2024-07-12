//
//  ShowUnitResultViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class ShowUnitResultViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet weak var unitResultLabel: UILabel!
    private var university, college, department: Unit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    
    private func uiSet(){
        self.navigationController?.isNavigationBarHidden = true
        nextButton.layer.cornerRadius = 30
        resetButton.layer.cornerRadius = 30
        subtitleLabel.setLineSpacing(spacing: 9)
        unitResultLabel.setLineSpacing(spacing: 16)
        if let data = UserDefaults.standard.data(forKey: "university") {
            do {
                university = try decoder.decode(Unit.self, from: data)
            }catch {
                print("데이터 디코딩 실패")
            }
        }
        if let data = UserDefaults.standard.data(forKey: "college") {
            do {
                college = try decoder.decode(Unit.self, from: data)
            }catch {
                print("데이터 디코딩 실패")
            }
        }
        if let data = UserDefaults.standard.data(forKey: "department") {
            do {
                department = try decoder.decode(Unit.self, from: data)
            }catch {
                print("데이터 디코딩 실패")
            }
        }
        unitResultLabel.text = (university?.unitName ?? "오류") + "\n" + (college?.unitName ?? "") + "\n" + (department?.unitName ?? "")
        unitResultLabel.textAlignment = .center

    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        if let nextVC = self.navigationController?.viewControllers.first(where: { $0 is SelectUniversityViewController }) {
            self.navigationController?.popToViewController(nextVC, animated: true)
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let nextVC = MainViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
