//
//  SelectDepartmentViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class SelectDepartmentViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var departmentPickerView: UIPickerView!
    @IBOutlet private weak var nameSubtitleLabel: UILabel!
    private var college: Unit?
    private var departmentList: [Unit]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadUserData()
    }
    private func loadUserData(){
        if let data = UserDefaults.standard.data(forKey: "college") {
            do {
                college = try decoder.decode(Unit.self, from: data)
            }catch {
                print("데이터 디코딩 실패")
            }
        }
        departmentList = college?.childUnit
        departmentPickerView.delegate = self
        departmentPickerView.dataSource = self
    }
    
    private func uiSet(){
        self.navigationController?.isNavigationBarHidden = true
        nextButton.layer.cornerRadius = 30
        subtitleLabel.setLineSpacing(spacing: 9)
        departmentPickerView.tintColor = .white
        nameSubtitleLabel.text = "거의 다 왔어요!\n"+(UserDefaults.standard.string(forKey: "nickname") ?? "오류") + "님은\n 어느 학과/부에 소속되어 있나요?"
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let selectedDepartment = departmentList?[departmentPickerView.selectedRow(inComponent: 0)]
        saveUnit(unit: selectedDepartment, forKey: "department")
        let nextVC = ShowUnitResultViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

extension SelectDepartmentViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let titleData = departmentList?[row].unitName else { return NSAttributedString() }
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.white,
                    .font: UIFont(name: "Pretendard-Bold", size: 38) ?? UIFont.systemFont(ofSize: 38)]
        let attributedString = NSAttributedString(string: titleData, attributes: attributes)
        return attributedString
    }
}

extension SelectDepartmentViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departmentList?.count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return departmentList?[row].unitName
    }
    
}
