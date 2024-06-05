//
//  UnidirectionalDataFlowType.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
