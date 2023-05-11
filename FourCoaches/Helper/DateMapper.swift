//
//  DateMapper.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 07/05/2023.
//

import Foundation

class DateMapper {
    static func getCurrentDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constanst.YEAR_MONTH_DAY_DATE_FORMAT
        return dateFormatter.string(from: Date())
    }
    
    static func geDateAfterDayes(dayCount:Int) -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constanst.YEAR_MONTH_DAY_DATE_FORMAT
        return dateFormatter.string(from:Calendar.current.date(byAdding: .day, value: dayCount, to: today) ?? today)
    }
    
    static func formatMatchDate(date:String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constanst.YEAR_MONTH_DAY_DATE_FORMAT
        let secondDateFormatter = DateFormatter()
        secondDateFormatter.dateFormat = Constanst.MONTH_DAY_DATE_FORMATER
        return secondDateFormatter.string(from: dateFormatter.date(from: date ?? "") ?? Date())
    }
}
