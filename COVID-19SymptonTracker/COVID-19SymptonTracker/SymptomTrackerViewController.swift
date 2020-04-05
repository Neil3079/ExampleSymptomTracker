//
//  SymptomTrackerViewController.swift
//  COVID-19SymptonTracker
//
//  Created by Neil Horton on 03/04/2020.
//  Copyright © 2020 theappbusiness. All rights reserved.
//

import UIKit
import CareKit

final class SymptomTrackerViewController: OCKDailyPageViewController {
    
    init(storeManager: OCKSynchronizedStoreManager = CareStoreReferenceManager.shared.synchronizedStoreManager) {
        super.init(storeManager: storeManager)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Track daily symptoms"
    }
    
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController,
                                          prepare listViewController: OCKListViewController, for date: Date) {
        
        let identifiers = CareStoreReferenceManager.TaskIdentifiers.allCases.map { $0.rawValue }
        var query = OCKTaskQuery(for: date)
        query.ids = identifiers
        query.excludesTasksWithNoEvents = true
        
        storeManager.store.fetchAnyTasks(query: query, callbackQueue: .main) { result in
            guard let tasks = try? result.get() else { return }
            
            tasks.forEach { task in
                switch task.id {
                case CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue:
                    let coughingCard = OCKButtonLogTaskViewController(task: task,
                                                                      eventQuery: .init(for: date),
                                                                      storeManager: self.storeManager)
                    listViewController.appendViewController(coughingCard, animated: false)
                default: return
                }
            }
        }
    }
}
