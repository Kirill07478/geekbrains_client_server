//
//  File.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 02.04.2021.
//

import Foundation

struct News: CustomStringConvertible {
    
    var writer: Friend
    var timeOfCreation: String
    var heading: String
    var descriptionNews: String?
    var image: String?
    var likeOrNot: Bool
    
    var description: String {
        return heading
    }
    
}

// MARK: - Fake Data
extension News {
    static var news1: News = News(writer: Friend.marc, timeOfCreation: "3 сентября 2020",
                                  heading: "Праздники программистов",
                                  descriptionNews: "Знаете ли Вы, что кроме официального праздника программиста (13 сентября – «день программиста») существуют другие праздники, отмечаемые ими, а именно – день сисадмина (последняя пятница июля), день компьютерщика (14 февраля), день веб-программиста (4 апреля) и даже день тестировщика (9 сентября). Не забывайте в эти день поздравлять тех, кто посвятил себя этим нелёгким профессиям.",
                                  image: "news1.jpg", likeOrNot: false)
    
    static var news2: News = News(writer: Friend.marc, timeOfCreation: "3 сентября 2020",
                                  heading: "Многообразие языков программирования",
                                  descriptionNews: "В мире существует около 8 500 языков программирования (да-да, именно так), но при этом число языков, которые используют чаще всего, чуть больше десятка. Это связано с малой востребованностью, а, следовательно, плохой продажей продукта, с невозможностью найти компромисс создателям языка, и с различного рода недоделками. Вот как думают и комментируют читатели: Pascal и DELPHI - рулят! И вообще - лучший язык тот, на котором можешь написать что-то более весомое, чем Hello World.",
                                  image: "news2.jpg", likeOrNot: false)
    
    static var news3: News = News(writer: Friend.marc, timeOfCreation: "3 сентября 2020",
                                  heading: "Популярные игры на С++",
                                  descriptionNews: "Игра World of Tanks, Minecraft, Tankionline написаны на языке С++.",
                                  image: "news3.jpg", likeOrNot: false)
    
    static var news4: News = News(writer: Friend.marc, timeOfCreation: "3 сентября 2020",
                                  heading: "Баги",
                                  descriptionNews: "Ошибка программы была названа багом (bug) потому, что в первые компьютеры заползали жучки (bugs), которые замыкали собой контакты и ломали тем самым ход выполнения программ. С тех пор так и повелось различные огрехи ПО называть багами, bugs.",
                                  image: "news4.jpg", likeOrNot: false)
    
    static var news5: News = News(writer: Friend.marc, timeOfCreation: "3 сентября 2020",
                                  heading: "Зарождение программирования",
                                  descriptionNews: "В 1804 году Жозеф Мари Жаккард построил жаккардовый ткацкий станок, в котором узор на ткани можно было программировать с помощью перфокарт.",
                                  image: nil, likeOrNot: false)
    
    static func allNews() -> [News] {
        return [.news1, .news2, .news3, .news4, .news5]
    }
}
