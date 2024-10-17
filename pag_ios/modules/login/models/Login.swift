//
//  Login.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

struct LoginName: Codable {
    let login: LoginModel
}

struct LoginModel: Codable {
    let accessToken: String
}
