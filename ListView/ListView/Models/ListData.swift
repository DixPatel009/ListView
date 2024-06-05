//
//  ListData.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation

struct ListData: Decodable, Hashable {
    var source: String?
    var abstract: String?
    var web_url: String?
    var headline: HeadlineData
}

