//
//  StatusViewModel.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 06/09/2024.
//

import SwiftUI

class StatusViewModel : ObservableObject {
    
    @Published var status:  UserStatus = .notConfigured
    
    func updateStatus(_ status: UserStatus) {
        self.status = status
    }
}


enum UserStatus: Int, CaseIterable {
    case notConfigured
    case available
    case busy
    case school
    case movies
    case work
    case batterLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        switch self {
        case .notConfigured: return "Click here to update your status"
        case .available: return "Available"
        case .busy: return "Busy"
        case .school: return "At School"
        case .movies: return "Watching a Movie"
        case .work: return "At Work"
        case .batterLow: return "Battery Low"
        case .meeting: return "In a Meeting"
        case .gym: return "At the Gym"
        case .sleeping: return "Sleeping"
        case .urgentCallsOnly: return "Urgent Calls Only"
        }
    }
}


