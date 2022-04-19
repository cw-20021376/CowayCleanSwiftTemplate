//
//  Extension+Date.swift
//  SubCWPopup
//
//  Created by cw-james on 2022/01/20.
//

import Foundation

public extension Date {
    func afterDays(_ afterDays: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.day = afterDays
        
        return Calendar.current.date(byAdding: dateComponents, to: self)
    }
}
