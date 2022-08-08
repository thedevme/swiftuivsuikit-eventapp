import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders], content: {
                Section(header: ListHeaderView()) {
                    ForEach(0..<3) { _ in
                        ListItemView()
                    }
                }
                
                Section(header: ListHeaderView()) {
                    ForEach(0..<1) { _ in
                        ListItemView()
                    }
                }
                
                Section(header: ListHeaderView()) {
                    ForEach(0..<6) { _ in
                        ListItemView()
                    }
                }
            })
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
