import SwiftUI
import Foundation
import HealthKit

struct ContentView: View {
    @EnvironmentObject var healthStore: HealthStore

    var body: some View {
        Text("Hello, world!")
          .padding()
          .onAppear {
            healthStore.requestAuthorization()
        }
    }

}

class HealthStore: ObservableObject {
    let healthStore = HKHealthStore()

    func requestAuthorization() {
        // The quantity type to write to the health store.
        let typesToShare: Set = [
          HKQuantityType.workoutType()
        ]

        // The quantity types to read from the health store.
        let typesToRead: Set = [
          HKQuantityType.quantityType(forIdentifier: .heartRate)!,
          HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
          HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
          HKQuantityType.quantityType(forIdentifier: .distanceCycling)!,
          HKObjectType.activitySummaryType()
        ]

        // Request authorization for those quantity types.
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            if !success {
                print("requestAuthorization failed")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
