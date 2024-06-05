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
                
        HStack(spacing: 8) {
            if let image = list.multimedia?[0].url,
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
                Text("\(list.headline?.main ?? "Loading...")")
                    .font(.system(size: 12, weight: .heavy, design: .rounded))
                    .redacted(reason: list.headline?.main == nil ? .placeholder : [])
                Text("\(list.abstract ?? "")")
                    .font(.system(size: 8, design: .rounded))
                    .redacted(reason: list.abstract == nil ? .placeholder : [])
                HStack {
                    Spacer()
                    Text("\(list.pubDate?.convertedDateToString() ?? "")")
                        .font(.system(size: 8, design: .rounded))
                        .redacted(reason: list.pubDate == nil ? .placeholder : [])
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

//#if DEBUG
//struct ListRow_Previews : PreviewProvider {
//    static var previews: some View {
//        ListRow(list:
//                    ListData()
//        )
//    }
//}
//#endif

func dateToString(date: String?) -> String? {
print(date)
    
    guard let date = date else {
        return "Dixit"
    }
    
    return "date"
    
//    // Create Date Formatter
//    let dateFormatter = DateFormatter()
//
//    // Set Date Format
//    dateFormatter.dateFormat = "YY/MM/dd"
//
//    // Convert Date to String
//    return dateFormatter.string(from: date)
}
