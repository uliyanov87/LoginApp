//
//  Person.swift
//  LoginApp
//
//  Created by Nikita Uliyanov on 05.10.2022.
//

struct Person {
    let name: String
    let surname: String
    let company: String
    let workingPosition: String
    let personInfo: String
    
    static func getInfo() -> Person {
        Person(
            name: "Никита",
            surname: "Ульянов",
            company: "Apple",
            workingPosition: "Apple Solution Consultant",
            personInfo: "Варю пиво")
    }
}
