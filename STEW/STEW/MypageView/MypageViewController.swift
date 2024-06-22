//
//  MypageViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/22/24.
//

import UIKit

class MypageViewController: UIViewController {
    @IBOutlet weak var mypageTableView: UITableView!
    
    private var configList = ["환경설정","개발자 정보","문의"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        tableViewConfig()
    }
    private func uiSet(){
    }
    private func tableViewConfig(){
        mypageTableView.delegate = self
        mypageTableView.dataSource = self
        let nibName = UINib(nibName: "MypageTableViewCell", bundle: nil)
        mypageTableView.register(nibName, forCellReuseIdentifier: "MypageTableViewCell")
    }
}

extension MypageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mypageTableView.dequeueReusableCell(withIdentifier: "MypageTableViewCell", for: indexPath) as? MypageTableViewCell else { return UITableViewCell() }
        cell.mypageTitleLabel.text = configList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: 추가 UI 구현하여 연결하기
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

