import SwiftUI

struct SwiftUIListView: View {
    let okashiList = getOkashiList()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIListView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListView(okashiList: getOkashiList())
            .previewDevice(PreviewDevice(rawValue: "iPod touch (7th generation)"))
    }
}
