//
//  ListViewApp.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import SwiftUI

@main
struct ListViewApp: App {
    
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: .init() )
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
