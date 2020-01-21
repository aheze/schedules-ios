//
//  SettingsView.swift
//  schedules
//
//  Created by H. Kamran on 1/20/20.
//  Copyright © 2020 H. Kamran. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State private var start_up_schedule = schedule1
    
    var body: some View {
        Text("Change on startup schedule")
            .contextMenu {
                for schedule in schedules {
                    Button(action: {
                        self.start_up_schedule = schedule
                    }) {
                        Text(schedule.name)
                    }
                }
            }
        .navigationBarTitle(Text("Settings"), displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
