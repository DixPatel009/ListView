//
//  ListView.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.itemsArr, id: \.self) { list in
                ListRow(list: list)
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
            .navigationBarTitle(Text("List View"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView(viewModel: .init())
    }
}
#endif
