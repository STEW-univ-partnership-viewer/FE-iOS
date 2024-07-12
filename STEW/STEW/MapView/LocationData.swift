//
//  LocationData.swift
//  STEW
//
//  Created by 황채웅 on 7/11/24.
//

import Foundation
import NMapsMap

// 초기 위치: 고민사거리
let initialPosition = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.494913714426986, lng: 126.95651999073173), zoomTo: 16)

// 업체 데이터 저장 구조체
struct Location: Codable{
    let name: String
    let category: categories
    let latitude: Double
    let longitude: Double
    let unit: [Unit]
    let benefit: [Unit : String]
}

// 업체 카테고리 enum
enum categories : Codable{
    case culture
    case cafe
    case restaurant
    case alcohol
}

let realFry = Location(name: "리얼후라이 숭실대점",
                       category: .restaurant,
                       latitude: 37.517808199016606,
                       longitude: 126.97103086709166,
                       unit: [soongsilItCollege,soongsilScienceCollege],
                       benefit: [
                        soongsilItCollege : "테이블 당 콜라 제공",
                        soongsilScienceCollege : "치킨 한 마리 당 과일 맥주 1잔 제공"])

let stone504 = Location(name: "스톤504 스테이크하우스",
                        category: .restaurant,
                        latitude: 37.517808199016606,
                        longitude: 126.97103086709166,
                        unit: [soongsilSciencePhysics,soongsilITComputer],
                        benefit: [
                            soongsilSciencePhysics : "파스타 공짜",
                            soongsilITComputer : "피자 공짜"])

let trueMuscleGym = Location(name: "트루머슬짐 PT",
                             category: .culture,
                             latitude: 37.49677724982536,
                             longitude: 126.9524987473893,
                             unit: [soongsilUniversity],
                             benefit: [
                                soongsilUniversity : "헬스이용권 10% 할인\nPT 20% 할인"])
