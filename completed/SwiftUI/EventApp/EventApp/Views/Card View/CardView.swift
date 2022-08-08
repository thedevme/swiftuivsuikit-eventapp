import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(spacing: 30) {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<10) { _ in
                            DayItemView()
                        }
                    }
                    .padding(.leading, 100)
                }
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    Image("month-bg")
                        .resizable()
                        .frame(width: 89, height: 75)
                    Text("SEP")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.leading, 20)
                }
            }.padding(.top, 20)
            
            GeometryReader { geo in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -20) {
                        ForEach(0..<6) { _ in
                            RoundedRectangle(cornerRadius: 20)
                                .padding(.horizontal)
                                .foregroundColor(Color.baseCardColor)
                                .frame(width: geo.size.width - 15, height: 585, alignment: .center)
                        }
                    }
                }
            }
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
