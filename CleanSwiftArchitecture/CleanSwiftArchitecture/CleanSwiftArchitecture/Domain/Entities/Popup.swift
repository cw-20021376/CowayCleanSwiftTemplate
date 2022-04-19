//
//  Popup.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/04.
//

struct Popup {
    var id: String
    var hideDurationDays: Int
    var onlyOnce: Bool
    var contentsUrl: String
    
    init(id: String, hideDurationDays: Int, onlyOnce: Bool, contentsUrl: String) {
        self.id = id
        self.hideDurationDays = hideDurationDays
        self.onlyOnce = onlyOnce
        self.contentsUrl = contentsUrl
    }
}
