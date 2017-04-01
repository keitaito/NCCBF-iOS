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
    
    case HokkaNichibeiKai(CLLocationCoordinate2D, String)
    case HotelKabukiSakuraRoom(CLLocationCoordinate2D, String)
    case JCCCNC(CLLocationCoordinate2D, String)
    case JCCCNC_ClassroomOne(CLLocationCoordinate2D, String)
    case JCCCNC_ClassroomTwo(CLLocationCoordinate2D, String)
    case JCCCNC_Gym(CLLocationCoordinate2D, String)
    case JCCCNC_IsseiMemorialHall(CLLocationCoordinate2D, String)
    case KabukiCinemas(CLLocationCoordinate2D, String)
    case KinokuniyaBookstore(CLLocationCoordinate2D, String)
    case KonkoChurch(CLLocationCoordinate2D, String)
    case NationalJACLBuilding(CLLocationCoordinate2D, String)
    case NationalJapaneseAmericanHistoricalSociety(CLLocationCoordinate2D, String)
    case NewPeople(CLLocationCoordinate2D, String)
    case PeacePlazaStage(CLLocationCoordinate2D, String)
    case PostAndBuchanan(CLLocationCoordinate2D, String)
    case Sakura360(CLLocationCoordinate2D, String)
    case Sakura360Stage(CLLocationCoordinate2D, String)
    case SequoiasAuditorium(CLLocationCoordinate2D, String)
    case TateuchiAuditorium(CLLocationCoordinate2D, String)
    case UnionBankCommunityRoom(CLLocationCoordinate2D, String)
    case WebsterStreetStage(CLLocationCoordinate2D, String)
    case unknown
}

extension EventLocation {
    init(locationName: String) {
        switch locationName {
        case "Hokka Nichibei Kai":
            self = .HokkaNichibeiKai(japantownCoordinate, locationName)
        case "Hotel Kabuki Sakura Room":
            self = .HotelKabukiSakuraRoom(japantownCoordinate, locationName)
        case "JCCCNC":
            self = .JCCCNC(japantownCoordinate, locationName)
        case "JCCCNC - Classroom One":
            self = .JCCCNC_ClassroomOne(japantownCoordinate, locationName)
        case "JCCCNC - Classroom Two":
            self = .JCCCNC_ClassroomTwo(japantownCoordinate, locationName)
        case "JCCCNC - Gym":
            self = .JCCCNC_Gym(japantownCoordinate, locationName)
        case "JCCCNC - Issei Memorial Hall":
            self = .JCCCNC_IsseiMemorialHall(japantownCoordinate, locationName)
        case "Kabuki Cinemas":
            self = .KabukiCinemas(japantownCoordinate, locationName)
        case "Kinokuniya Bookstore":
            self = .KinokuniyaBookstore(japantownCoordinate, locationName)
        case "Konko Church":
            self = .KonkoChurch(japantownCoordinate, locationName)
        case "National JACL Building":
            self = .NationalJACLBuilding(japantownCoordinate, locationName)
        case "National Japanese American Historical Society":
            self = .NationalJapaneseAmericanHistoricalSociety(japantownCoordinate, locationName)
        case "New People":
            self = .NewPeople(japantownCoordinate, locationName)
        case "Peace Plaza Stage":
            self = .PeacePlazaStage(japantownCoordinate, locationName)
        case "Post & Buchanan":
            self = .PostAndBuchanan(japantownCoordinate, locationName)
        case "Sakura 360":
            self = .Sakura360(japantownCoordinate, locationName)
        case "Sakura 360 Stage":
            self = .Sakura360Stage(japantownCoordinate, locationName)
        case "Sequoias Auditorium":
            self = .SequoiasAuditorium(japantownCoordinate, locationName)
        case "Tateuchi Auditorium":
            self = .TateuchiAuditorium(japantownCoordinate, locationName)
        case "Union Bank Community Room":
            self = .UnionBankCommunityRoom(japantownCoordinate, locationName)
        case "Webster Street Stage":
            self = .WebsterStreetStage(japantownCoordinate, locationName)
            
        default:
            self = .unknown
        }
    }
}

extension EventLocation {
    var coordinate: CLLocationCoordinate2D {
        switch self {
        
        case .HokkaNichibeiKai(let coordinate, _):
            return coordinate
        case .HotelKabukiSakuraRoom(let coordinate, _):
            return coordinate
        case .JCCCNC(let coordinate, _):
            return coordinate
        case .JCCCNC_ClassroomOne(let coordinate, _):
            return coordinate
        case .JCCCNC_ClassroomTwo(let coordinate, _):
            return coordinate
        case .JCCCNC_Gym(let coordinate, _):
            return coordinate
        case .JCCCNC_IsseiMemorialHall(let coordinate, _):
            return coordinate
        case .KabukiCinemas(let coordinate, _):
            return coordinate
        case .KinokuniyaBookstore(let coordinate, _):
            return coordinate
        case .KonkoChurch(let coordinate, _):
            return coordinate
        case .NationalJACLBuilding(let coordinate, _):
            return coordinate
        case .NationalJapaneseAmericanHistoricalSociety(let coordinate, _):
            return coordinate
        case .NewPeople(let coordinate, _):
            return coordinate
        case .PeacePlazaStage(let coordinate, _):
            return coordinate
        case .PostAndBuchanan(let coordinate, _):
            return coordinate
        case .Sakura360(let coordinate, _):
            return coordinate
        case .Sakura360Stage(let coordinate, _):
            return coordinate
        case .SequoiasAuditorium(let coordinate, _):
            return coordinate
        case .TateuchiAuditorium(let coordinate, _):
            return coordinate
        case .UnionBankCommunityRoom(let coordinate, _):
            return coordinate
        case .WebsterStreetStage(let coordinate, _):
            return coordinate
            
        default:
            return japantownCoordinate
        }
    }
    
    var name: String {
        switch self {
            
        case .HokkaNichibeiKai(_, let name):
            return name
        case .HotelKabukiSakuraRoom(_, let name):
            return name
        case .JCCCNC(_, let name):
            return name
        case .JCCCNC_ClassroomOne(_, let name):
            return name
        case .JCCCNC_ClassroomTwo(_, let name):
            return name
        case .JCCCNC_Gym(_, let name):
            return name
        case .JCCCNC_IsseiMemorialHall(_, let name):
            return name
        case .KabukiCinemas(_, let name):
            return name
        case .KinokuniyaBookstore(_, let name):
            return name
        case .KonkoChurch(_, let name):
            return name
        case .NationalJACLBuilding(_, let name):
            return name
        case .NationalJapaneseAmericanHistoricalSociety(_, let name):
            return name
        case .NewPeople(_, let name):
            return name
        case .PeacePlazaStage(_, let name):
            return name
        case .PostAndBuchanan(_, let name):
            return name
        case .Sakura360(_, let name):
            return name
        case .Sakura360Stage(_, let name):
            return name
        case .SequoiasAuditorium(_, let name):
            return name
        case .TateuchiAuditorium(_, let name):
            return name
        case .UnionBankCommunityRoom(_, let name):
            return name
        case .WebsterStreetStage(_, let name):
            return name
            
        default:
            return "Japantown"
        }
    }
}
