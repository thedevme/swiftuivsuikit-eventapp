import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        HStack {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Image("month-bg")
                Text("SEP")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.leading, 20)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("99 Events")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.baseSecondaryTextColor)
                .padding(.trailing)
        }
        .padding(.top, 20)
        .background(Color.white)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
