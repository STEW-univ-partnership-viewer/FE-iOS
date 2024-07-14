//
//  UnitData.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import Foundation

let encoder = JSONEncoder()
let decoder = JSONDecoder()

// 단위 데이터 저장 클래스
class Unit: Hashable, Codable{
    static func == (lhs: Unit, rhs: Unit) -> Bool {
        return lhs.unitName == rhs.unitName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(unitName)
    }
    
    let unitName: String!
    var childUnit: [Unit]?
    var benefits: [Location : String]?
    init(unitName: String!,
         childUnit: [Unit]? = nil,
         benefits : [Location : String]? = nil) {
        self.childUnit = childUnit
        self.unitName = unitName
        self.benefits = benefits
    }
}

// 학부 생성
let soongsilSciencePhysics = Unit(unitName: "물리학과")
let soongsilScienceChemistry = Unit(unitName: "화학과")
let soongsilITGlobalmedia = Unit(unitName: "글로벌미디어학부")
let soongsilITComputer = Unit(unitName: "컴퓨터학부",benefits: [meokDwaeji: "카카오페이 결제 시 10% 할인"])
let soongsilITSoftware = Unit(unitName: "소프트웨어학부")

// 단과대 생성
let soongsilScienceCollege = Unit(unitName: "자연과학대학", childUnit: [soongsilSciencePhysics, soongsilScienceChemistry])
let soongsilItCollege = Unit(unitName: "IT대학", childUnit: [soongsilITGlobalmedia, soongsilITComputer, soongsilITSoftware],benefits: [realFry: "테이블 당 콜라 1캔 제공",stone504: "파스타 무료 제공", trueMuscleGym: "PT 20% 할인"])

// 대학교 생성
let soongsilUniversity = Unit(unitName: "숭실대학교", childUnit: [soongsilScienceCollege, soongsilItCollege], benefits: [padongChuya: "테이블 당 막걸리 1병 무료", mealPlanB:"토핑 2종류 추가 제공",goCine: "새우튀김 서비스 제공"])




// 건국대학교
let konkukSciencePhysics = Unit(unitName: "물리학과")
let konkukScienceChemistry = Unit(unitName: "화학과")

let konkukEngineeringComputer = Unit(unitName: "컴퓨터공학과")
let konkukEngineeringElectric = Unit(unitName: "전기전자공학과")

// 단과대 생성
let kokkukEngineeringCollege = Unit(unitName: "자연과학대학", childUnit: [konkukSciencePhysics, konkukScienceChemistry])
let kokkukScienceCollege = Unit(unitName: "공과대학", childUnit: [konkukEngineeringComputer, konkukEngineeringElectric])

// 대학교 생성
let konkukUniversity = Unit(unitName: "건국대학교", childUnit: [kokkukEngineeringCollege, kokkukScienceCollege])

let universityList: [Unit] = [soongsilUniversity, konkukUniversity]

func decodeUnit(forKey key: String) -> Unit? {
    if let data = UserDefaults.standard.data(forKey: key) {
        do {
            return try decoder.decode(Unit.self, from: data)
        } catch {
            print("\(key) 데이터 디코딩 실패")
        }
    }
    return nil
}

func saveUnit(unit: Unit?, forKey key: String) {
    guard let unit = unit else { return }
    do {
        let encodedData = try encoder.encode(unit)
        UserDefaults.standard.set(encodedData, forKey: key)
    } catch {
        print("\(key) 데이터 인코딩 실패")
    }
}
