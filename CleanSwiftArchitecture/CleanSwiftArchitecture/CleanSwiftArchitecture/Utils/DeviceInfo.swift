//
//  DeviceInfo.swift
//  CowayPopup
//
//  Created by cw-james on 2022/01/26.
//

import UIKit

public class DeviceInfo: NSObject {
    public static func deviceUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}
