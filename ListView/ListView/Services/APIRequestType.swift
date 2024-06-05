//
//  APIRequestType.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}
