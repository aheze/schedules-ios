//
//  ContentView.swift
//  schedules
//
//  Created by H. Kamran on 11/25/19.
//  Copyright © 2019 H. Kamran. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        if !self.settings.basic_configuration_set {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("[CV-N] All set!")
                    self.settings.basic_configuration_set = true
                    self.settings.notification_permissions_granted = true
                } else if let error = error {
                    print(error.localizedDescription)
                    self.settings.basic_configuration_set = true
                    self.settings.notification_permissions_granted = false
                }
            }
        }
        
        return NavigationView {
            List(schedules) { schedule in
                NavigationLink(destination: ScheduleView(schedule: schedule)) {
                    HStack {
                        Text(schedule.name)
                        Spacer()
                        if schedule.name == self.settings.start_up_schedule.name {
                            Image(systemName: "play.circle")
                                .font(.body)
                        }
                    }
                }
            }

            .navigationBarTitle("Schedules")
            .navigationBarItems(trailing:
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings())
    }
}
