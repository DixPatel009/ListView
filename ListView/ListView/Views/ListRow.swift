//
//  ListRow.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import SwiftUI

struct ListRow: View {
    
    @State var list: LocalListModel
    
    var body: some View {
        
        HStack(spacing: 8) {
            if let image = list.image,
               let url = URL(string: "https://static01.nyt.com/" + image) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("\(list.title ?? "Loading...")")
                    .font(.system(size: 12, weight: .heavy, design: .rounded))
                    .redacted(reason: list.title == nil ? .placeholder : [])
                Text("\(list.subDescription ?? "")")
                    .font(.system(size: 8, design: .rounded))
                    .redacted(reason: list.subDescription == nil ? .placeholder : [])
                HStack {
                    Spacer()
                    Text("\(list.date?.convertedString() ?? "")")
                        .font(.system(size: 8, design: .rounded))
                        .redacted(reason: list.date?.convertedString() == nil ? .placeholder : [])
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

#if DEBUG
struct ListRow_Previews : PreviewProvider {
    static var previews: some View {
        ListRow(list:
                    LocalListModel()
        )
    }
}
#endif

