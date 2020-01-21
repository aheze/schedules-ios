//
//  ContentView.swift
//  schedules
//
//  Created by H. Kamran on 11/25/19.
//  Copyright © 2019 H. Kamran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(schedules) { schedule in
                NavigationLink(destination: ScheduleView(schedule: schedule)) {
                    HStack {
                        Text(schedule.name)
                        Spacer()
                        if schedule.start {
                            Image(systemName: "play.fill")
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
        ContentView()
    }
}
