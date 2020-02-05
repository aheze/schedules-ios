//
//  Helpers.swift
//  schedules
//
//  Created by H. Kamran on 1/20/20.
//  Copyright © 2020 H. Kamran. All rights reserved.
//

import Foundation
import UserNotifications

class UserSettings: ObservableObject {
    @Published var basic_configuration_set = false
    @Published var notification_permissions_granted = false
    
    @Published var start_up_schedule = schedule1
    
    @Published var show_start_up_schedule = false
    @Published var show_notifications = true
}

struct Schedule: Identifiable {
    let id = UUID()
    let name: String
    let color: Array<Int>
}

var schedule1 = Schedule(name: "Acalanes High School", color: [26/255, 70/255, 143/255]),
    schedule2 = Schedule(name: "Campolindo High School", color: [168/255, 0/255, 0/255]),
    schedule3 = Schedule(name: "M.H. Stanley Middle School", color: [0/255, 99/255, 52/255])

var schedules = [schedule1, schedule2, schedule3]

func show_notification(title: String, subtitle: String, sound: Bool) {
    let content = UNMutableNotificationContent()
    
    content.title = title
    content.subtitle = subtitle
    
    if sound {
        content.sound = UNNotificationSound.default
    }

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request)
}
