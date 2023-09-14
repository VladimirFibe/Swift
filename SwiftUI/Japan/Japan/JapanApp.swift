import SwiftUI

@main
struct JapanApp: App {
    @StateObject private var dataModel = DataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
