//
//  SettingsView.swift
//  schedules
//
//  Created by H. Kamran on 1/20/20.
//  Copyright © 2020 H. Kamran. All rights reserved.
//

import SwiftUI
import SwiftEntryKit

struct SettingsView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        return List {
            Toggle(isOn: $settings.show_notifications) {
                Text("Show notifications?")
            }
            
            Toggle(isOn: $settings.show_start_up_schedule) {
                VStack(alignment: .leading) {
                    Text("\(settings.start_up_schedule.name)")
                    Text("Change the startup schedule")
                        .font(.caption)
                        .onTapGesture {
                            let action_sheet_view = ActionSheetView()
                            
                            var sek_attributes = EKAttributes.bottomFloat
                            sek_attributes.entryBackground = .color(color: .white)
                            sek_attributes.entranceAnimation = .translation
                            sek_attributes.exitAnimation = .translation
                            sek_attributes.displayDuration = .infinity
                            sek_attributes.positionConstraints.size.height = .constant(value: 150)
                            sek_attributes.statusBar = .dark
                            sek_attributes.entryInteraction = .dismiss
                            
                            SwiftEntryKit.display(entry: action_sheet_view, using: sek_attributes)
                        }
                }
            }
            
            Button(action: {
                show_notification(title: "AHS Schedules", subtitle: "X minutes/seconds remaining", sound: false)
            }) {
                Text("Schedule a Notification")
            }
        }
        .padding()
        .navigationBarTitle(Text("Settings"), displayMode: .inline)
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
