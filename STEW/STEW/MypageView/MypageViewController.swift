//
//  MypageViewController.swift
//  STEW
//
//  Created by 황채웅 on 7/21/24.
//

import UIKit

class MypageViewController: UIViewController {
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userUniversityLabel: UILabel!
    @IBOutlet weak var mypageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfig()
    }
    
    private func collectionViewConfig() {
        mypageCollectionView.backgroundColor = .clear
        mypageCollectionView.register(UINib(nibName: "MypageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MypageCollectionViewCell")
        mypageCollectionView.register(UINib(nibName: "MypageSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MypageSectionHeaderView")
        mypageCollectionView.register(UINib(nibName: "MypageSectionFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "MypageSectionFooterView")
        mypageCollectionView.delegate = self
        mypageCollectionView.dataSource = self
    }
}

extension MypageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 66)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 2{
            return CGSize(width: collectionView.bounds.width, height: 15)
        }else {
            return CGSize(width: collectionView.bounds.width, height: 1)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 35)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 22, right: 0)
    }
}

extension MypageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 1
        default: return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MypageCollectionViewCell", for: indexPath) as? MypageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.mypageLabelText = {
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0: return "닉네임 수정"
                case 1: return "프로필 사진 수정"
                default: return "나의 학교 정보 수정"
                }
            case 1: return "문의하기"
            default:
                switch indexPath.row {
                case 0: return "환경설정"
                default: return "만든 사람들"
                }
            }
        }()
        cell.awakeFromNib()  // Manually call awakeFromNib to update the label text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MypageSectionHeaderView", for: indexPath) as? MypageSectionHeaderView else {
                return UICollectionReusableView()
            }
            header.mypageSectionLabelText = {
                switch indexPath.section {
                case 0: return "정보 수정"
                case 1: return "고객센터"
                default: return "서비스 설정"
                }
            }()
            header.awakeFromNib()  // Manually call awakeFromNib to update the label text
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "MypageSectionFooterView", for: indexPath) as? MypageSectionFooterView else {
                return UICollectionReusableView()
            }
            if indexPath.section == 2 {
                footer.backgroundColor = .clear
                footer.versionLabel.isHidden = false
            }else {
                footer.backgroundColor = .white
                footer.versionLabel.isHidden = true
            }
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension MypageViewController: UICollectionViewDelegate {
    // TODO: 화면 전환
}
