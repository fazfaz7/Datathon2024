import SwiftUI
import CoreLocation

struct MapView: View {
  @StateObject private var locationManager = LocationManager()
  let destination = CLLocationCoordinate2D(latitude: 0, longitude: -20) // Replace with your destination coordinates

  var body: some View {
    VStack {
      Text("Live Location Tracking")
        .padding()
      if let location = locationManager.location {
        Text("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
      } else {
        Text("Waiting for location data...")
      }
      Spacer()
    }
    .onAppear(perform: {
      locationManager.requestLocationAuthorization()
      locationManager.startMonitoringForRegion(center: destination, radius: 100.0, identifier: "destinationRegion")
    })
  }
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
  private let locationManager = CLLocationManager()

  var location: CLLocation? {
    return locationManager.location
  }

  func requestLocationAuthorization() {
    locationManager.requestWhenInUseAuthorization()
  }

  func startMonitoringForRegion(center: CLLocationCoordinate2D, radius: CLLocationDistance, identifier: String) {
    let region = CLCircularRegion(center: center, radius: radius, identifier: identifier)
    locationManager.delegate = self
      locationManager.startMonitoring(for: region)
  }

  func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
    showNotification(title: "Arrived!", body: "You've reached your destination.")
  }

  func showNotification(title: String, body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
  }
}
