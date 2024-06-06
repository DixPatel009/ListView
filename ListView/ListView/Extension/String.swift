//
//  String.swift
//  ListView
//
//  Created by Dixit Mac New on 06/06/24.
//

import Foundation

extension String {
    
    func convertedDateToString() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM yyyy"
        let datee = dateFormatterGet.date(from: self)
        return dateFormatterPrint.string(from: datee ?? Date())
    }
    
    func convertedDate() -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatterGet.date(from: self) ?? Date()
    }
    
}

extension Date {
    
    func convertedString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM yyyy"
        return dateFormatterPrint.string(from: self)
    }
    
}
