import SwiftUI

struct DayItemView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                Image("date-selected-dot")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .offset(x: 10, y: -5)
                Text("99").font(.system(size: 16, weight: .bold))
            }
            
            Text("Thu")
                .foregroundColor(.baseSecondaryTextColor)
                .font(.system(size: 14, weight: .semibold))
        }
        .foregroundColor(.black)
        .frame(width: 62, height: 70)
        .background(Color.baseDayBackgroundColor)
        .clipShape(
            RoundedRectangle(cornerRadius: 6)
        )
    }
}

struct DayItemView_Previews: PreviewProvider {
    static var previews: some View {
        DayItemView()
    }
}
