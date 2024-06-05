//
//  APIServiceType.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation
import Combine

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}
