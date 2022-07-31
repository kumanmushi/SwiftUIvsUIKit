import Kingfisher
import SwiftUI

struct SwiftUIListView: View {
    let okashiList: [Okashi]

    var body: some View {
        List(okashiList, id: \.id) { okashi in
            OkashiCell(okashi: okashi)
                .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
        .listStyle(.plain)
        .padding(.top, 8)
        .navigationTitle(FrameworkType.swiftUi.name)
    }
}

struct OkashiCell: View {
    let okashi: Okashi

    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: okashi.image))
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .background { Color.black }
                .cornerRadius(2)

            VStack(alignment: .leading, spacing: 5) {
                Text(okashi.name)
                    .lineLimit(nil)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.init(hex: "333333"))
                Text(okashi.maker)
                    .lineLimit(1)
                    .font(.system(size: 11))
                    .foregroundColor(.init(hex: "777777"))
            }
        }
        .listRowSeparator(.hidden)
        .onTapGesture {
            UIApplication.shared.open(URL(string: okashi.url)!)
        }
    }
}

struct SwiftUIListView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListView(okashiList: getOkashiList())
            .previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
    }
}
