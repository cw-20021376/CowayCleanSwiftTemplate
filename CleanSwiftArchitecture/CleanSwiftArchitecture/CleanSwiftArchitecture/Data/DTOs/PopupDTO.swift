//
//  PopupDTO.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/04.
//

struct PopupDTO: Codable {
    var id: String
    var hideDurationDays: Int
    var onlyOnce: Bool
    var contentsUrl: String
    
    func toPopup() -> Popup {
        return Popup(id: id, hideDurationDays: hideDurationDays, onlyOnce: onlyOnce, contentsUrl: contentsUrl)
    }
}
