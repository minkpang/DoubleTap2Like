//
//  ImageCard.swift
//  flitto_ios
//
//  Created by minkpang on 2022/01/25.
//

import Foundation

struct ImageModel: Identifiable, Codable {
    let id: String
    let author: String
    let download_url: String
}
