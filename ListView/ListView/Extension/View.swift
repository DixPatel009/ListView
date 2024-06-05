//
//  View.swift
//  ListView
//
//  Created by Dixit Mac New on 06/06/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
