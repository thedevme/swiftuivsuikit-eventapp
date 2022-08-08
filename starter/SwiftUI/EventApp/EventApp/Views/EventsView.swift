import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct EventsView: View {
    @State private var isShowingCard = false
    
    var body: some View {
        NavigationView {
            if isShowingCard {
                CardView()
                    .navigationTitle(Text("Upcoming Events"))
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        Button(action: { isShowingCard.toggle() }) {
                            Image("list-icon")
                        }
                    }
            } else {
                ListView()
                    .navigationTitle(Text("Upcoming Events"))
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        Button(action: { isShowingCard.toggle() }) {
                            Image("card-icon")
                        }
                    }
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
