//
//  UserInfo.swift
//  UsersList
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import Foundation

// MARK: - UserInfoElement
struct UserInfoElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias UserInfo = [UserInfoElement]
