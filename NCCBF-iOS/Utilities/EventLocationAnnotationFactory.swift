//
//  EventLocationAnnotationFactory.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class EventLocationAnnotationFactory {
    class func createAnnotations(
        with sections: [NSFetchedResultsSectionInfo]) -> [EventLocationAnnotation] {
        
        var result = [EventLocationAnnotation]()
        
        for sectionInfo in sections {
            let sectionName = sectionInfo.name
            
            let eventLocation = EventLocation(locationName: sectionName)
            
            guard let objects = sectionInfo.objects as? [Event] else { return result }
            
            let annotation = EventLocationAnnotation(events: objects, eventLocation: eventLocation)
            result.append(annotation)
        }
        
        return result
    }
}
