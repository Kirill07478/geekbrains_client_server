//
//  GroupModel.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 04.03.2021.
//

import Foundation

struct Group {
    var name: String
    var image: String?
    
}

// MARK: -Fake Data

extension Group {
    static let group1 = Group(name: "Рыбалка", image: "cloud.moon.rain")
    static let group2 = Group(name: "Сноубординг", image: "snow")
    static let group3 = Group(name: "Майнкрафт", image: "play.fill")
    static let group4 = Group(name: "4А класс", image: "person.3.fill")
    static let group5 = Group(name: "Работа СПБ", image: "calendar")
    static let group6 = Group(name: "Барахолка МСК", image: "bag")
    static let group7 = Group(name: "Тут очень смешные шуточки", image: "smiley")
    static let group8 = Group(name: "Продам группу", image: "music.note.house")
    static let group9 = Group(name: "GeekBrains", image: "ruler.fill")
    
    static func allGroups () -> [Group] {
        return [.group1, .group2, .group3, .group4, .group5, .group6, .group7, .group8, .group9]
    }
}
