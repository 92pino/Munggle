//
//  Modules.swift
//  DependencyPlugin
//
//  Created by Jinbae Jeong on 3/20/25.
//

import Foundation
import ProjectDescription

public enum ModulePath {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
    case userInterface(UserInterface)
}

public extension ModulePath {
    enum App: String, CaseIterable {
        case IOS
        
        public static let name: String = "App"
    }
}

public extension ModulePath {
    enum Feature: String, CaseIterable {
        case Home
        
        public static let name: String = "Feature"
    }
}

public extension ModulePath {
    enum Domain: String, CaseIterable {
        case Home
        
        public static let name: String = "Domain"
    }
}

public extension ModulePath {
    enum Core: String, CaseIterable {
        case Storage
        case Network
        
        public static let name: String = "Core"
    }
}

public extension ModulePath {
    enum Shared: String, CaseIterable {
        case ThirdPartyLib
        
        public static let name: String = "Shared"
    }
}

public extension ModulePath {
    enum UserInterface: String, CaseIterable {
        case UI
        
        public static let name: String = "UserInterface"
    }
}
