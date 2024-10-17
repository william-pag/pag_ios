//
//  DataModel.swift
//  pag_ios
//
//  Created by William Vux on 14/10/24.
//

import Foundation


struct DataModel<M: Codable>: Codable {
    let data: M
}
