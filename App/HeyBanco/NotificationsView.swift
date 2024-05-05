//
//  NotificationsView.swift
//  HeyBanco
//
//  Created by Adrian Faz on 05/05/24.
//

import SwiftUI
import UserNotifications

struct NotificationsView: View {
    var body: some View {
        VStack{
            Button {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Request Permission")
            }
            
            Button {
                let content = UNMutableNotificationContent()
                content.title = "Registra tu compra!"
                content.subtitle = "Detectamos que estás cerca de un establecimiento. Da click para registrar tu compra con voz."
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            } label: {
                Text("Schedule Notification")
            }
        }
    }
}

#Preview {
    NotificationsView()
}
