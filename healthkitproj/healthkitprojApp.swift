import SwiftUI

 @main
struct HealthKitApp: App {
    @StateObject private var healthStore = HealthStore()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(healthStore)
        }
    }
}
