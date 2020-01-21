//
//  ScheduleView.swift
//  schedules
//
//  Created by H. Kamran on 1/20/20.
//  Copyright © 2020 H. Kamran. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    let schedule: Schedule
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var back_button: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "list.bullet")
        }
    }
    
    var body: some View {
        Text("#" + schedule.color)
        
        .navigationBarTitle(Text(schedule.name), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: back_button)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(schedule: schedule1)
    }
}
