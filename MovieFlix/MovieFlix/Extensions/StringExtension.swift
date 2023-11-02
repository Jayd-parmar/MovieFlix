//
//  StringExtension.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 02/11/23.
//

import Foundation

extension String {
    func convertDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "MM/dd/yy"
            dateFormatter.locale = Locale(identifier: "en_US")
            return dateFormatter.string(from: date)
        } else {
            return "11/11/11"
        }
    }
    
    func convertMinutesToHoursMinutes(minutes: Int) -> String {
        let hrs = minutes / 60
        let min = minutes % 60

        let formattedString = String(format: "%02d:%02d", hrs, min)
        return formattedString
    }
}
