//
//  ListRow.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import SwiftUI

struct ListRow: View {
    
    @State var list: ListData
    
    var body: some View {
        Text(list.abstract ?? "")
    }
}

#if DEBUG
struct ListRow_Previews : PreviewProvider {
    static var previews: some View {
        ListRow(list:
                    ListData()
        )
    }
}
#endif
