//
//  CloudKit.swift
//  THE KAREN APP
//
//  Created by Temesha Holley on 1/31/24.
//

import Foundation
import CloudKit
import SwiftUI




class CloudKitService {
    enum CloudKitServiceError: Error {
        case recordNotInDatabase
    }
    private let container = CKContainer(identifier: "iCloud.com.CoryTripathy.CloudKitShare")
    
    private lazy var database = container.publicCloudDatabase
   
    let firstIncident = IncidentModel [0]
    print ("name: \(firstIncident.name)")
    print ("incident: \(firstIncident.incident)")
    print ("image: \firstIncident.image)")
    print ("timestamp: \firstIncident.timestamp)")
    
    
   
    
    
   
    
    public func saveEvent(_ event: IncidentModel) async throws {
        
        let record = CKRecord(recordType: "Event", recordID: .init(recordName: event.id))
        record["name"] = event.name
        record["incident"] = event.incident
        record["image"] = event.image
        record["timestamp"] = event.timestamp
        
        try await database.save(record)
        
    }
    public func fetchEvents() async throws -> [IncidentModel] {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "IncidentModel", predicate: predicate)
        let (matchResults, _) = try await database.records(matching: query)
        let results = matchResults.map { matchResult in
            return matchResult.1
        }
        
        let records = results.compactMap { result in
            try? result.get()
        }
        let events: [IncidentModel] = records.compactMap { record in
            guard let name = record["name: Model.name"] as? String,
                  let incident = record["incident: Model.incident"] as? String,
                  let image = record["image: Model.image"] as? String,
                  let timestamp = record["timestamp: Model.timestamp"] as? Date else {
                return nil
            }
            return IncidentModel(
                name: name,
                incident: incident,
                image: image,
                timestamp: timestamp)
        }
        
        
        return events
    }
    
    public func updateEvent(_ event: IncidentModel) async throws {
        guard let fetchedRecord = try? await database.record(for: .init(recordName: event.id)) else {
            throw CloudKitServiceError.recordNotInDatabase
        }
        
        let record = CKRecord(recordType: "IncidentModel", recordID: fetchedRecord.recordID)
        
               record["name"] = event.name
               record["icident"] = event.incident
               record["image"] = event.image
               record["timestamp"] = event.timestamp
        
        _ = try await database.modifyRecords(saving: [record], deleting: [])
    }
    
    public func deleteEvent(_ event: IncidentModel) async throws {
        guard let fetchedRecord = try? await database.record(for: .init(recordName: event.id)) else {
            throw CloudKitServiceError.recordNotInDatabase
        }
        _ = try await database.modifyRecords(saving: [], deleting: [fetchedRecord.recordID])
        
      
    }
}

