import SwiftUI

struct ListingView: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ListingView()
        .environmentObject(DataModel())
}
