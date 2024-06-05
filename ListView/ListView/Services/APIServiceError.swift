//
//  APIServiceError.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
