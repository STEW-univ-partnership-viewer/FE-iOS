//
//  LocationData.swift
//  STEW
//
//  Created by 황채웅 on 7/11/24.
//

import Foundation
import NMapsMap

// 숭실대 초기 위치: 고민사거리
let soongsilInitialPosition = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.494913714426986, lng: 126.95651999073173), zoomTo: 16)

// 업체 데이터 저장 구조체
struct Location: Codable, Hashable {
    let name: String
    let category: categories
    let latitude: Double
    let longitude: Double
    let address: String
    let imageData: Data

    var image: UIImage? {
        return UIImage(data: imageData)
    }

    init(name: String, category: categories, latitude: Double, longitude: Double, address: String, image: UIImage) {
        self.name = name
        self.category = category
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.imageData = image.pngData()!
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case category
        case latitude
        case longitude
        case address
        case imageData
    }
}

// 업체 카테고리 enum
enum categories: String, Codable{
    case culture = "문화"
    case cafe = "카페"
    case restaurant = "식당"
    case alcohol = "술집"
}

let realFry = Location(name: "리얼후라이 숭실대점",
                       category: .restaurant,
                       latitude: 37.517808199016606,
                       longitude: 126.97103086709166,
                       address: "서울특별시 동작구 상도제1동 사당로 6-1",
                       image: .megaBox
)

let stone504 = Location(name: "스톤504 스테이크하우스",
                        category: .restaurant,
                        latitude: 37.4946280990986,
                        longitude: 126.95777253406374,
                        address: "서울특별시 동작구 상도동 상도로61길 54",
                        image: .megaBox
)

let trueMuscleGym = Location(name: "트루머슬짐 PT",
                             category: .culture,
                             latitude: 37.49677724982536,
                             longitude: 126.9524987473893,
                             address: "서울특별시 동작구 상도로62길 29 지하 1층",
                             image: .megaBox
)
let padongChuya = Location(name: "파동추야",
                           category: .alcohol,
                           latitude: 37.49591700798818,
                           longitude: 126.95304774700273,
                           address: "동작구 상도로58길 4 경원빌딩", 
                           image: .lifeBeer
)

let mealPlanB = Location(name: "밀플랜비 숭실대점",
                         category: .restaurant,
                         latitude: 37.49483934283463,
                         longitude: 126.95641543315388,
                         address: "동작구 상도로67길 27 2층", 
                         image: .megaBox
)

let goCine = Location(name: "고씨네 숭실대점",
                      category: .restaurant,
                      latitude: 37.49494578859641,
                      longitude: 126.95800982737721,
                      address: "동작구 사당로 32-1 1층 101호",
                      image: .noMorePizza
)

let meokDwaeji = Location(name: "먹돼지",
                          category: .restaurant,
                          latitude: 37.49496782365307,
                          longitude: 126.95665283074163,
                          address: "동작구 상도로67길 32 1층",
                          image: .megaBox
)
