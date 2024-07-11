//
//  UnitData.swift
//  STEW
//
//  Created by 황채웅 on 7/12/24.
//

import Foundation

class Unit: Hashable{
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
let soongsilSciencephysics = Unit(unitName: "물리학과")
let soongsilSciencechemistry = Unit(unitName: "화학과")
let soongsilITglobalmedia = Unit(unitName: "글로벌미디어학부")
let soongsilITcomputer = Unit(unitName: "컴퓨터학부")
let soongsilITsoftware = Unit(unitName: "소프트웨어학부")

// 단과대 생성
let soongsilScienceCollege = Unit(unitName: "자연과학대학", childUnit: [soongsilSciencephysics, soongsilSciencechemistry])
let soongsilItCollege = Unit(unitName: "IT대학", childUnit: [soongsilITglobalmedia, soongsilITcomputer, soongsilITsoftware])

// 대학교 생성
let soongsilUniversity = Unit(unitName: "숭실대학교", childUnit: [soongsilScienceCollege, soongsilItCollege])
