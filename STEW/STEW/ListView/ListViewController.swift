//
//  ListViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/22/24.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    @IBOutlet weak var listViewCollectionView: UICollectionView!
    private var university,college,department: Unit?
    private var sectionList: [String?] = ["전체 학생회", "총학생회", "단과대 학생회", "학부 학생회"]
    private var wholeBenefits,universityBenefits,collegeBenefits,departmentBenefits: [Location: String]?
    private var selectedIndexPath: IndexPath? = IndexPath(item: 0, section: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        collectionViewConfigure()
    }
    private func uiSet(){
        university = decodeUnit(forKey: "university")
        college = decodeUnit(forKey: "college")
        department = decodeUnit(forKey: "department")
        universityBenefits = university?.benefits ?? [:]
        collegeBenefits = college?.benefits ?? [:]
        departmentBenefits = department?.benefits ?? [:]
        wholeBenefits = universityBenefits
        wholeBenefits?.merge(collegeBenefits ?? [:]) { (_, new) in new }
        wholeBenefits?.merge(departmentBenefits ?? [:]) { (_, new) in new }
    }
    private func collectionViewConfigure(){
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        tabBarCollectionView.backgroundColor = .clear
        tabBarCollectionView.register(UINib(nibName: "tabBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tabBarCollectionViewCell")
        
        listViewCollectionView.delegate = self
        listViewCollectionView.dataSource = self
        listViewCollectionView.backgroundColor = .clear
        listViewCollectionView.register(UINib(nibName: "ListViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListViewCollectionViewCell")
        
    }
}

extension ListViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabBarCollectionView {
            // Deselect the previously selected cell if there is one
            if let previousIndexPath = selectedIndexPath {
                if let previousCell = collectionView.cellForItem(at: previousIndexPath) as? tabBarCollectionViewCell {
                    previousCell.notSelected()
                }
            }
            // Select the new cell
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? tabBarCollectionViewCell {
                selectedCell.selected()
            }
            // Update the selected index path
            selectedIndexPath = indexPath
            listViewCollectionView.reloadData()
        }
    }
}

extension ListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case tabBarCollectionView :
            return 4
        case listViewCollectionView :
            switch selectedIndexPath?.row{
            case 0:
                return wholeBenefits?.count ?? 0
            case 1:
                return universityBenefits?.count ?? 0
            case 2:
                return collegeBenefits?.count ?? 0
            case 3:
                return departmentBenefits?.count ?? 0
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case tabBarCollectionView :
            guard let sectionCell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "tabBarCollectionViewCell", for: indexPath) as? tabBarCollectionViewCell else { return UICollectionViewCell() }
            sectionCell.unitNameLabel.text = sectionList[indexPath.row]
            if indexPath == selectedIndexPath {
                sectionCell.selected()
            } else {
                sectionCell.notSelected()
            }
            return sectionCell
        case listViewCollectionView :
            guard let collectionViewCell = listViewCollectionView.dequeueReusableCell(withReuseIdentifier: "ListViewCollectionViewCell", for: indexPath) as? ListViewCollectionViewCell else {
                            return UICollectionViewCell()
                        }
                        
                        var location: Location?
                        switch selectedIndexPath?.row {
                        case 0:
                            if let keysArray = wholeBenefits?.keys.sorted(by: { $0.name < $1.name }) as? [Location] {
                                location = keysArray[indexPath.row]
                            }
                        case 1:
                            if let keysArray = universityBenefits?.keys.sorted(by: { $0.name < $1.name }) as? [Location] {
                                location = keysArray[indexPath.row]
                            }
                        case 2:
                            if let keysArray = collegeBenefits?.keys.sorted(by: { $0.name < $1.name }) as? [Location] {
                                location = keysArray[indexPath.row]
                            }
                        case 3:
                            if let keysArray = departmentBenefits?.keys.sorted(by: { $0.name < $1.name }) as? [Location] {
                                location = keysArray[indexPath.row]
                            }
                        default:
                            location = nil
                        }
                        
                        if let location = location {
                            collectionViewCell.configure(with: location)
                        }
                        return collectionViewCell
        default:
            return UICollectionViewCell()
        }
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == listViewCollectionView{
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 100) // Adjust the height as needed
        }else{
            return CGSize(width: 75, height: 24)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tabBarCollectionView{
            let totalCellWidth = 75 * CGFloat(4)
            let totalSpacingWidth = CGFloat(4 - 1) * 10 // Assuming 10 points of spacing between each cell
            
            let leftInset = (collectionView.frame.width - (totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            
            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)} else {
                return UIEdgeInsets()
            }
    }
    
}
