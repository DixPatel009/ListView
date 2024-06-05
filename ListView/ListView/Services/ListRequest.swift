//
//  ListRequest.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation


struct ListRequest: APIRequestType {
    typealias Response = ListResponse
    
    var path: String { return "articlesearch.json" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: "election"),
            .init(name: "api-key", value: "j5GCulxBywG3lX211ZAPkAB8O381S5SM")
        ]
    }
}
