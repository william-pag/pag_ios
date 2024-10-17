//
//  UtilFormats.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

final class UtilFormats {
    public static let shared = UtilFormats()
    
    public let dateInF: DateFormatter = DateFormatter()
    public let dateOutF: DateFormatter = DateFormatter()
    
    init () {
        dateInF.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        dateOutF.dateFormat = "dd-MM-yyyy"
    }
    
    func setFormatters(dateIn: String?, dateOut: String?) {
        if let dateIn {
            dateInF.dateFormat = dateIn
        }
        
        if let dateOut {
            dateOutF.dateFormat = dateOut
        }
    }
    
    func formatDate(_ date: String) -> String? {
        let data = dateInF.date(from: date)
        if let data {
            return dateOutF.string(from: data)
        } else {
            return nil
        }
    }
    
    func htmlString(str: String) -> NSAttributedString? {
        guard let data = str.data(using: .utf8) else { return nil }
        return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    }
}
