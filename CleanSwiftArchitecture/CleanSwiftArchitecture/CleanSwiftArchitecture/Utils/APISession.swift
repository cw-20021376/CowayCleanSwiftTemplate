//
//  APISession.swift
//  CowaySDKLogin
//
//  Created by cw-james on 2022/02/22.
//

import Alamofire

class APISession {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()
}
