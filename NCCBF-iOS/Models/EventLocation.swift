//
//  EventLocation.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation
import MapKit

let japantownCoordinate = CLLocationCoordinate2D(latitude: 37.785939, longitude: -122.430485)

enum EventLocation {
    
    case HokkaNichibeiKai(CLLocationCoordinate2D)
    case HotelKabukiSakuraRoom(CLLocationCoordinate2D)
    case JCCCNC(CLLocationCoordinate2D)
    case JCCCNC_ClassroomOne(CLLocationCoordinate2D)
    case JCCCNC_ClassroomTwo(CLLocationCoordinate2D)
    case JCCCNC_Gym(CLLocationCoordinate2D)
    case JCCCNC_IsseiMemorialHall(CLLocationCoordinate2D)
    case KabukiCinemas(CLLocationCoordinate2D)
    case KinokuniyaBookstore(CLLocationCoordinate2D)
    case KonkoChurch(CLLocationCoordinate2D)
    case NationalJACLBuilding(CLLocationCoordinate2D)
    case NationalJapaneseAmericanHistoricalSociety(CLLocationCoordinate2D)
    case NewPeople(CLLocationCoordinate2D)
    case PeacePlazaStage(CLLocationCoordinate2D)
    case PostAndBuchanan(CLLocationCoordinate2D)
    case Sakura360(CLLocationCoordinate2D)
    case Sakura360Stage(CLLocationCoordinate2D)
    case SequoiasAuditorium(CLLocationCoordinate2D)
    case TateuchiAuditorium(CLLocationCoordinate2D)
    case UnionBankCommunityRoom(CLLocationCoordinate2D)
    case WebsterStreetStage(CLLocationCoordinate2D)
    case unknown
}

extension EventLocation {
    init(locationName: String) {
        switch locationName {
        case "Hokka Nichibei Kai":
            self = .HokkaNichibeiKai(japantownCoordinate)
        case "Hotel Kabuki Sakura Room":
            self = .HotelKabukiSakuraRoom(japantownCoordinate)
        case "JCCCNC":
            self = .JCCCNC(japantownCoordinate)
        case "JCCCNC - Classroom One":
            self = .JCCCNC_ClassroomOne(japantownCoordinate)
        case "JCCCNC - Classroom Two":
            self = .JCCCNC_ClassroomTwo(japantownCoordinate)
        case "JCCCNC - Gym":
            self = .JCCCNC_Gym(japantownCoordinate)
        case "JCCCNC - Issei Memorial Hall":
            self = .JCCCNC_IsseiMemorialHall(japantownCoordinate)
        case "Kabuki Cinemas":
            self = .KabukiCinemas(japantownCoordinate)
        case "Kinokuniya Bookstore":
            self = .KinokuniyaBookstore(japantownCoordinate)
        case "Konko Church":
            self = .KonkoChurch(japantownCoordinate)
        case "National JACL Building":
            self = .NationalJACLBuilding(japantownCoordinate)
        case "National Japanese American Historical Society":
            self = .NationalJapaneseAmericanHistoricalSociety(japantownCoordinate)
        case "New People":
            self = .NewPeople(japantownCoordinate)
        case "Peace Plaza Stage":
            self = .PeacePlazaStage(japantownCoordinate)
        case "Post & Buchanan":
            self = .PostAndBuchanan(japantownCoordinate)
        case "Sakura 360":
            self = .Sakura360(japantownCoordinate)
        case "Sakura 360 Stage":
            self = .Sakura360Stage(japantownCoordinate)
        case "Sequoias Auditorium":
            self = .SequoiasAuditorium(japantownCoordinate)
        case "Tateuchi Auditorium":
            self = .TateuchiAuditorium(japantownCoordinate)
        case "Union Bank Community Room":
            self = .UnionBankCommunityRoom(japantownCoordinate)
        case "Webster Street Stage":
            self = .WebsterStreetStage(japantownCoordinate)
            
        default:
            self = .unknown
        }
    }
}
