//
//  Session.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 11.04.2021.
//

import Foundation

final class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var name = ""
    var id = 0
    var token = ""
}
