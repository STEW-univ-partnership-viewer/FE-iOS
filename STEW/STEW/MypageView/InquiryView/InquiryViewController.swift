//
//  InquiryViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/23/24.
//

import UIKit

class InquiryViewController: UIViewController {
    @IBOutlet weak var inquiryTextView: UITextView!
    @IBOutlet weak var inquirySendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        // Do any additional setup after loading the view.
    }
    @IBAction func inquirySendButtonTapped(_ sender: UIButton) {
        //TODO: 문의 전송 API 요청
        self.dismiss(animated: true)
    }
    private func uiSet(){
        inquiryTextView.delegate = self
        inquiryTextView.layer.borderColor = UIColor.lightGray.cgColor
        inquiryTextView.layer.borderWidth = 1
        inquiryTextView.layer.cornerRadius = 5
        inquirySendButton.backgroundColor = .lightGray
        inquirySendButton.layer.cornerRadius = 3
    }
}

extension InquiryViewController: UITextViewDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) /// 화면을 누르면 키보드 내려가게 하는 것
    }
}
