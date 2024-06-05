//
//  ListData.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation

struct ListData: Decodable, Hashable {
    var abstract: String?
    var pubDate: String?
    var headline: HeadlineData?
    var multimedia: [MultimediaData]?
}


struct MultimediaData: Decodable, Hashable {
    var url: String?
}
