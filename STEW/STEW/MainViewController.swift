//
//  ViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/22/24.
//

import UIKit

class MainViewController: UITabBarController {
    let APIKey = Bundle.main.infoDictionary?["APIKey"] as! String

    override func viewDidLoad() {
            super.viewDidLoad()
            setupTabBarItems()
            setupTabBar(eachSide: 70, addHeight: 11)
        }
        
        // MARK: - Tabbar Setting
    private func setupTabBarItems() {
            let mapViewController = MapViewController()
        mapViewController.tabBarItem.image = UIImage(systemName: "map")
            
            let ListViewController = ListViewController()
        ListViewController.tabBarItem.image = UIImage(systemName: "list.bullet")
                                                      
            let MypageViewController = MypageViewController()
        MypageViewController.tabBarItem.image = UIImage(systemName: "person.fill")
    
            
            viewControllers = [mapViewController, ListViewController, MypageViewController]
        }
    // MARK: - Layer Setup
    private func setupTabBar(eachSide space: CGFloat, addHeight: CGFloat) {
        // CAShapeLayer 객체 생성
        let layer = CAShapeLayer()
        
        // tab bar layer 세팅
        let x: CGFloat = space                                // x 축으로 이동한 거리 (여백)
        let width: CGFloat = tabBar.bounds.width - (x * 2)    // 너비: 기본 탭바의 너비 - (여백 * 2)
        let baseHeight: CGFloat = 49                          // 기본 높이 (변경 X)
        let currentHeight: CGFloat = baseHeight + addHeight   // 높이를 설정 (기본높이 + 추가 높이)
        let y: CGFloat = -(5.5 + addHeight/2)                 // Y축 = 아이콘의 중간으로 맞춤

        // 알약 모양으로 UIBezierPath 생성
        let path = UIBezierPath(roundedRect: CGRect(x: x,
                                                    y: y,
                                                    width: width,
                                                    height: currentHeight),
                                cornerRadius: currentHeight / 2).cgPath
        layer.path = path

        layer.fillColor = UIColor.white.cgColor
        
        // tab bar layer 그림자 설정
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)  // 밑면 그림자 크기
        layer.shadowRadius = 5.0                              // 흐려지는 반경
        layer.shadowOpacity = 0.5                             // 불투명도 (0 ~ 1)
        
        // tab bar layer 삽입: addSublayer대신 insertSublayer(0번째 Sublayer에 대치) 사용
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
        // tab bar items의 위치 설정
        self.tabBar.itemWidth = width / 5
        self.tabBar.itemPositioning = .centered
        
        // 틴트 컬러 설정
        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
    }

}
