import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
//        if dataModel.isLoading {
//            VStack(spacing: 10) {
//                Image(systemName: "antenna.radiowaves.left.and.right")
//                    .font(.system(size: 72))
//                Text("Loading")
//                    .font(.title3)
//            }
//        } else {
            ListingView()
//        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataModel())
}
