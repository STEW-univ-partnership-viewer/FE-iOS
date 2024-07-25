//
//  NickNameViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import UIKit

class NickNameViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var nicknameTextField: UITextField!
    private let MAX_LENGTH = 5
    var onlyNickname = false
    private var nicknameChecked: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        uiSet()
    }
    
    private func uiSet(){
        self.navigationController?.isNavigationBarHidden = true
        nextButton.layer.cornerRadius = 30
        setupDismissKeyboardOnTapGesture()
        let attributedTitle = NSAttributedString(string: onlyNickname ? "완료" : "다음" , attributes: [
            .font: UIFont(name: "Pretendard-Bold", size: CGFloat(17)),
            .foregroundColor: UIColor.white
        ])
        nextButton.setAttributedTitle(attributedTitle, for: .normal)

    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.setValue(nicknameTextField.text, forKey: "nickname")
        if onlyNickname{
            navigationController?.popViewController(animated: true)
        }else{
            let nextVC = SelectUniversityViewController()
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
}
extension NickNameViewController{
    func setupDismissKeyboardOnTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
