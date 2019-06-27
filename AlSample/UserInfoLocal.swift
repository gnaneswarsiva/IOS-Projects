//
//  UserInfoLocal.swift
//  AlSample
//
//  Created by Gnaneswar on 6/25/19.
//  Copyright © 2019 Gnaneswar. All rights reserved.
//

import Foundation

struct Keys {
    static let music = "Music"
}
struct API {
    static let UD = UserDefaults.standard.set("https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/10/explicit.json", forKey: Keys.music)
}
