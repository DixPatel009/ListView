//
//  ListViewApp.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import SwiftUI

@main
struct ListViewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView(viewModel: .init() )
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
