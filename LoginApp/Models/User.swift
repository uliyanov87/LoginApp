//
//  User.swift
//  LoginApp
//
//  Created by Nikita Uliyanov on 05.10.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "User", password: "123", person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let photo: String
    let company: String
    let workingPosition: String
    let department: String
    let bio: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    static func getPerson() -> Person {
        Person(
            name: "Никита",
            surname: "Ульянов",
            photo: "Ulyanov Nikita",
            company: "Apple",
            workingPosition: "ASC",
            department: "Retail",
            bio: "Отработал в компании Apple 8 лет, всвязи с последними событиями компания ушла из России, поэтому теперь учусь на iOS разработчика и варю пиво по вечерам😎"
        )
    }
}
