//
//  SelectCollegeViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class SelectCollegeViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var collegePickerView: UIPickerView!
    @IBOutlet private weak var nameSubtitleLabel: UILabel!
    private var university: Unit?
    private var collegeList: [Unit]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadUserData()
    }
    
    private func loadUserData(){
        if let data = UserDefaults.standard.data(forKey: "university") {
            do {
                university = try decoder.decode(Unit.self, from: data)
            }catch {
                print("데이터 디코딩 실패")
            }
        }
        nameSubtitleLabel.text = (UserDefaults.standard.string(forKey: "nickname") ?? "오류") + "님은\n어느 단과대에 소속되어 있나요?"
        collegeList = university?.childUnit
        collegePickerView.delegate = self
        collegePickerView.dataSource = self
    }
    
    private func uiSet(){
        self.navigationController?.isNavigationBarHidden = true
        nextButton.layer.cornerRadius = 30
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        do {
            let encodedData = try encoder.encode(collegeList?[collegePickerView.selectedRow(inComponent: 0)])
            UserDefaults.standard.set(encodedData, forKey: "college")
        } catch {
            print("데이터 인코딩 실패")
        }
        let nextVC = SelectDepartmentViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

extension SelectCollegeViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let titleData = collegeList?[row].unitName else { return NSAttributedString() }
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.white, // 글자색
                    .font: UIFont(name: "Pretendard-Bold", size: 38) ?? UIFont.systemFont(ofSize: 38)]
        let attributedString = NSAttributedString(string: titleData, attributes: attributes)
        return attributedString
    }
}

extension SelectCollegeViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return collegeList?.count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return collegeList?[row].unitName
    }
    
}
