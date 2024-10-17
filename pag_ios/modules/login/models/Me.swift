//
//  Me.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

struct MeName: Codable {
    let me: MeModel
}


struct MeModel: Codable {
    let id: Int
    let name: String
    let image: String
    let email: String
    let cycleId: Int?
}
