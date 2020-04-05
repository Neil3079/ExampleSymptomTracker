//
//  CareStore.swift
//  COVID-19SymptonTracker
//
//  Created by Neil Horton on 05/04/2020.
//  Copyright © 2020 theappbusiness. All rights reserved.
//

import Foundation
import CareKit

// Singleton wrapper to hold a reference to OCKSynchronizedStoreManager and task identifiers
final class CareStoreReferenceManager {
    
    enum TaskIdentifiers: String, CaseIterable {
        case coughingEpisodes
    }
    
    static let shared = CareStoreReferenceManager()
    
    // Manages synchronization of a CoreData store
    lazy var synchronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "COVID19Tracker")
        store.populateDailyTasks()
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()
    
    private init() {}
}
