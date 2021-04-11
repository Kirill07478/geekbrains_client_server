//
//  UserModel.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 04.03.2021.
//

import Foundation

struct Friend: CustomStringConvertible {
    
    var name: String
    var surname: String
    var company: String
    var image: String?
        
    func fullName() -> String {
        return name + " " + surname
    }
    
    var description: String {
        return fullName()
    }
    
}

// MARK: -Fake Data

extension Friend {
    
    static let marc = Friend(name: "Марк", surname: "Цукерберг", company: "Facebook", image: "Marc1.jpg")
    static let linus = Friend(name: "Линус", surname: "Торвальдс", company: "Linux", image: "Linus2.jpg")
    static let bjarne = Friend(name: "Бьерн", surname: "Страуструп", company: "С++", image: "bjarne1.jpg")
    static let james = Friend(name: "Джеймс", surname: "Гослинг",company: "Java", image: "james2.jpg")
    static let brendan = Friend(name: "Брендан", surname: "Айк", company: "JavaScript", image: "Brendan5.jpg")
    static let dennis = Friend(name: "Деннис", surname: "Ритчи", company: "С", image: "dennis.jpg")
    static let bill = Friend(name: "Билл", surname: "Гейтс", company: "Windows", image: "bill.jpg")
    static let guido = Friend(name: "Гвидо", surname: "Ван Россум", company: "Python", image: "guido.jpg")
    static let alexei = Friend(name: "Алексей", surname: "Пажитнов", company: "Тетрис", image: "alexei.jpg")
    static let eugene = Friend(name: "Евгений", surname: "Касперский", company: "Лаборатория Касперского", image: "eugene.jpg")
    static let ilya = Friend(name: "Илья", surname: "Сегалович", company: "Яндекс", image: "ilya.jpg")
    static let pavel = Friend(name: "Павел", surname: "Дуров", company: "Вконтакте", image: "pavel.jpg")
    static let bram = Friend(name: "Брэм", surname: "Коэн", company: "BitTorrent", image: "bram.jpg")
    static let sergey = Friend(name: "Сергей", surname: "Брин", company: "Google", image: "sergey.jpg")
    static let tim = Friend(name: "Тим", surname: "Бернерс-Ли", company: "Http", image: "tim.jpg")
    static let anders = Friend(name: "Андерс", surname: "Хейлсберг", company: "Delphi", image: "anders.jpg")
    static let john = Friend(name: "Джон", surname: "Кармак", company: "Doom", image: "john.jpg")
    static let steven = Friend(name: "Стив", surname: "Джобс", company: "Apple", image: "steven.jpg")
    static let stephen = Friend(name: "Стив", surname: "Возняк", company: "Apple", image: "stephen.jpg")
    static let larry = Friend(name: "Ларри", surname: "Пейдж", company: "Google", image: "larry.jpg")
    static let igor = Friend(name: "Игорь", surname: "Данилов", company: "Dr. Web", image: "igor.jpg")
    static let dmitri = Friend(name: "Дмитрий", surname: "Крюков", company: "Rambler", image: "dmitri")
    static let boris = Friend(name: "Борис", surname: "Нуралиев", company: "1C", image: "boris.jpg")
    static let richard = Friend(name: "Ричард", surname: "Столлман", company: "GNU", image: "richard.jpg")
    static let david = Friend(name: "Дэвид", surname: "Паттерсон", company: "RISC", image: "david.jpg")
    static let kenneth = Friend(name: "Кен", surname: "Томпсон", company: "GO", image: "kenneth.jpg")
    
    static func allFriends() -> [Friend] {
        let friends: [Friend] = [.marc, .linus, .bjarne, .james, .brendan, .dennis, .bill, .guido, .alexei, .eugene, .ilya, .pavel, .bram, .sergey, .tim, .anders, .john, .steven, .stephen, .larry, .igor, .dmitri, .boris, .richard, .david, .kenneth]

        let sortedFriends = friends.sorted(by: {$0.surname.lowercased() < $1.surname.lowercased()})

        return sortedFriends
        
    }
}
