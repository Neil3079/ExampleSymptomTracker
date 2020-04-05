//
//  OCKDailyStore+PopulateCarePlan.swift
//  COVID-19SymptonTracker
//
//  Created by Neil Horton on 05/04/2020.
//  Copyright © 2020 theappbusiness. All rights reserved.
//

import Foundation
import CareKit

extension OCKStore {

    // Adds tasks and contacts into the store
    func populateDailyTasks() {

        let thisMorning = Calendar.current.startOfDay(for: Date())
        guard let beforeBreakfast = Calendar.current.date(byAdding: .hour, value: 8, to: thisMorning) else {
            return assertionFailure("Could not create time 8AM this morning")
        }

        let coughingSchedule = OCKSchedule(composing: [
            OCKScheduleElement(start: beforeBreakfast,
                               end: nil,
                               interval: DateComponents(day: 1),
                               text: "Anytime throughout the day",
                               targetValues: [],
                               duration: .allDay)
        ])

        var coughingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue,
                                   title: "Track coughing",
                                   carePlanID: nil, schedule: coughingSchedule)
        
        coughingTask.instructions = "If you have coughed for a duration of 1 minute or more please log it here."
        coughingTask.impactsAdherence = false
        addTask(coughingTask)
    }
}
