//
//  SelectUniversityViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class SelectUniversityViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var registerUniversityLabel: UILabel!
    @IBOutlet private weak var universityPickerView: UIPickerView!
    @IBOutlet private weak var nameSubtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    
    private func uiSet(){
        self.navigationController?.isNavigationBarHidden = true
        nextButton.layer.cornerRadius = 30
        registerUniversityLabel.setUnderline(width: 1)
        nameSubtitleLabel.text = (UserDefaults.standard.string(forKey: "nickname") ?? "오류") + "님은\n어느 대학교에 재학 중이신가요?"
        universityPickerView.delegate = self
        universityPickerView.dataSource = self
    }
    
    @IBAction func registerUniversityButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.naver.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        do {
            let encodedData = try encoder.encode(universityList[universityPickerView.selectedRow(inComponent: 0)])
            UserDefaults.standard.set(encodedData, forKey: "university")
        } catch {
            print("데이터 인코딩 실패")
        }
        let selectedUniversity = universityList[universityPickerView.selectedRow(inComponent: 0)]
        saveUnit(unit: selectedUniversity, forKey: "university")
        let nextVC = SelectCollegeViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

extension SelectUniversityViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let titleData = universityList[row].unitName else { return NSAttributedString() }
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Pretendard-Bold", size: 38) ?? UIFont.systemFont(ofSize: 38)]
        let attributedString = NSAttributedString(string: titleData, attributes: attributes)
        return attributedString
    }
}

extension SelectUniversityViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return universityList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return universityList[row].unitName
    }
    
}
