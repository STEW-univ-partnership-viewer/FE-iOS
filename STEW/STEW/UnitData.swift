//
//  UnitData.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import Foundation

let encoder = JSONEncoder()
let decoder = JSONDecoder()

class Unit: Hashable, Codable{
    static func == (lhs: Unit, rhs: Unit) -> Bool {
        return lhs.unitName == rhs.unitName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(unitName)
    }
    
    let unitName: String!
    var childUnit: [Unit]?
    var connectedCompanies: [Location]?
    init(unitName: String!,
         childUnit: [Unit]? = nil,
         connectedCompanies: [Location]? = nil) {
        self.childUnit = childUnit
        self.unitName = unitName
        self.connectedCompanies = connectedCompanies
    }
}

var result: [Unit] = []
// 학부 생성
let soongsilSciencePhysics = Unit(unitName: "물리학과")
let soongsilScienceChemistry = Unit(unitName: "화학과")
let soongsilITGlobalmedia = Unit(unitName: "글로벌미디어학부")
let soongsilITComputer = Unit(unitName: "컴퓨터학부")
let soongsilITSoftware = Unit(unitName: "소프트웨어학부")

// 단과대 생성
let soongsilScienceCollege = Unit(unitName: "자연과학대학", childUnit: [soongsilSciencePhysics, soongsilScienceChemistry])
let soongsilItCollege = Unit(unitName: "IT대학", childUnit: [soongsilITGlobalmedia, soongsilITComputer, soongsilITSoftware])

// 대학교 생성
let soongsilUniversity = Unit(unitName: "숭실대학교", childUnit: [soongsilScienceCollege, soongsilItCollege])




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
