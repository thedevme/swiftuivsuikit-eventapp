import SwiftUI

struct ListItemView: View {
    var body: some View {
        HStack(alignment:.center) {
            HStack(alignment: .center) {
                VStack {
                    Text("99")
                        .font(.system(size: 16, weight: .bold))
                    Text("XXX")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .semibold))
                }
                .frame(width:60, height: 45)
            }
            
            VStack {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(Color.baseCardColor)
                    .frame(width: 100, height: 150)
            }
            .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Meeting Auto").font(.system(size: 16, weight: .semibold))
                
                HStack {
                    Text("Beginning")
                        .frame(minWidth: 70, alignment: .leading)
                        .foregroundColor(.baseSecondaryTextColor)
                    Text("01:00 PM")
                    Spacer()
                }
                
                HStack {
                    Text("End")
                        .frame(minWidth: 70, alignment: .leading)
                        .foregroundColor(.baseSecondaryTextColor)
                    Text("01:00 PM")
                    Spacer()
                }
                
                HStack {
                    Text("Location")
                        .frame(minWidth: 70, alignment: .leading)
                        .foregroundColor(.baseSecondaryTextColor)
                    Text("Saint Cloud")
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .font(.system(size: 14, weight: .semibold))
            
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView()
    }
}
